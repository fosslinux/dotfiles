/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
function _encode(ch) {
    return '%' + ch.charCodeAt(0).toString(16).toUpperCase();
}
// see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent
function encodeURIComponent2(str) {
    return encodeURIComponent(str).replace(/[!'()*]/g, _encode);
}
function encodeNoop(str) {
    return str;
}
/**
 * Uniform Resource Identifier (URI) http://tools.ietf.org/html/rfc3986.
 * This class is a simple parser which creates the basic component paths
 * (http://tools.ietf.org/html/rfc3986#section-3) with minimal validation
 * and encoding.
 *
 *       foo://example.com:8042/over/there?name=ferret#nose
 *       \_/   \______________/\_________/ \_________/ \__/
 *        |           |            |            |        |
 *     scheme     authority       path        query   fragment
 *        |   _____________________|__
 *       / \ /                        \
 *       urn:example:animal:ferret:nose
 *
 *
 */
class URI {
    constructor() {
        this._scheme = URI._empty;
        this._authority = URI._empty;
        this._path = URI._empty;
        this._query = URI._empty;
        this._fragment = URI._empty;
        this._formatted = null;
        this._fsPath = null;
    }
    /**
     * scheme is the 'http' part of 'http://www.msft.com/some/path?query#fragment'.
     * The part before the first colon.
     */
    get scheme() {
        return this._scheme;
    }
    /**
     * authority is the 'www.msft.com' part of 'http://www.msft.com/some/path?query#fragment'.
     * The part between the first double slashes and the next slash.
     */
    get authority() {
        return this._authority;
    }
    /**
     * path is the '/some/path' part of 'http://www.msft.com/some/path?query#fragment'.
     */
    get path() {
        return this._path;
    }
    /**
     * query is the 'query' part of 'http://www.msft.com/some/path?query#fragment'.
     */
    get query() {
        return this._query;
    }
    /**
     * fragment is the 'fragment' part of 'http://www.msft.com/some/path?query#fragment'.
     */
    get fragment() {
        return this._fragment;
    }
    // ---- filesystem path -----------------------
    /**
     * Returns a string representing the corresponding file system path of this URI.
     * Will handle UNC paths and normalize windows drive letters to lower-case. Also
     * uses the platform specific path separator. Will *not* validate the path for
     * invalid characters and semantics. Will *not* look at the scheme of this URI.
     */
    get fsPath() {
        if (!this._fsPath) {
            var value;
            if (this._authority && this.scheme === 'file') {
                // unc path: file://shares/c$/far/boo
                value = `//${this._authority}${this._path}`;
            }
            else if (URI._driveLetterPath.test(this._path)) {
                // windows drive letter: file:///c:/far/boo
                value = this._path[1].toLowerCase() + this._path.substr(2);
            }
            else {
                // other path
                value = this._path;
            }
            if (process.platform === 'win32') {
                value = value.replace(/\//g, '\\');
            }
            this._fsPath = value;
        }
        return this._fsPath;
    }
    // ---- modify to new -------------------------
    with(scheme, authority, path, query, fragment) {
        var ret = new URI();
        ret._scheme = scheme || this.scheme;
        ret._authority = authority || this.authority;
        ret._path = path || this.path;
        ret._query = query || this.query;
        ret._fragment = fragment || this.fragment;
        URI._validate(ret);
        return ret;
    }
    withScheme(value) {
        return this.with(value, undefined, undefined, undefined, undefined);
    }
    withAuthority(value) {
        return this.with(undefined, value, undefined, undefined, undefined);
    }
    withPath(value) {
        return this.with(undefined, undefined, value, undefined, undefined);
    }
    withQuery(value) {
        return this.with(undefined, undefined, undefined, value, undefined);
    }
    withFragment(value) {
        return this.with(undefined, undefined, undefined, undefined, value);
    }
    // ---- parse & validate ------------------------
    static parse(value) {
        const ret = new URI();
        const data = URI._parseComponents(value);
        ret._scheme = data.scheme;
        ret._authority = decodeURIComponent(data.authority);
        ret._path = decodeURIComponent(data.path);
        ret._query = decodeURIComponent(data.query);
        ret._fragment = decodeURIComponent(data.fragment);
        URI._validate(ret);
        return ret;
    }
    static file(path) {
        const ret = new URI();
        ret._scheme = 'file';
        // normalize to fwd-slashes
        path = path.replace(/\\/g, URI._slash);
        // check for authority as used in UNC shares
        // or use the path as given
        if (path[0] === URI._slash && path[0] === path[1]) {
            let idx = path.indexOf(URI._slash, 2);
            if (idx === -1) {
                ret._authority = path.substring(2);
            }
            else {
                ret._authority = path.substring(2, idx);
                ret._path = path.substring(idx);
            }
        }
        else {
            ret._path = path;
        }
        // Ensure that path starts with a slash
        // or that it is at least a slash
        if (ret._path[0] !== URI._slash) {
            ret._path = URI._slash + ret._path;
        }
        URI._validate(ret);
        return ret;
    }
    static _parseComponents(value) {
        const ret = {
            scheme: URI._empty,
            authority: URI._empty,
            path: URI._empty,
            query: URI._empty,
            fragment: URI._empty,
        };
        const match = URI._regexp.exec(value);
        if (match) {
            ret.scheme = match[2] || ret.scheme;
            ret.authority = match[4] || ret.authority;
            ret.path = match[5] || ret.path;
            ret.query = match[7] || ret.query;
            ret.fragment = match[9] || ret.fragment;
        }
        return ret;
    }
    static create(scheme, authority, path, query, fragment) {
        return new URI().with(scheme, authority, path, query, fragment);
    }
    static _validate(ret) {
        // validation
        // path, http://tools.ietf.org/html/rfc3986#section-3.3
        // If a URI contains an authority component, then the path component
        // must either be empty or begin with a slash ("/") character.  If a URI
        // does not contain an authority component, then the path cannot begin
        // with two slash characters ("//").
        if (ret.authority && ret.path && ret.path[0] !== '/') {
            throw new Error('[UriError]: If a URI contains an authority component, then the path component must either be empty or begin with a slash ("/") character');
        }
        if (!ret.authority && ret.path.indexOf('//') === 0) {
            throw new Error('[UriError]: If a URI does not contain an authority component, then the path cannot begin with two slash characters ("//")');
        }
    }
    // ---- printing/externalize ---------------------------
    /**
     *
     * @param skipEncoding Do not encode the result, default is `false`
     */
    toString(skipEncoding = false) {
        if (!skipEncoding) {
            if (!this._formatted) {
                this._formatted = URI._asFormatted(this, false);
            }
            return this._formatted;
        }
        else {
            // we don't cache that
            return URI._asFormatted(this, true);
        }
    }
    static _asFormatted(uri, skipEncoding) {
        const encoder = !skipEncoding
            ? encodeURIComponent2
            : encodeNoop;
        const parts = [];
        let { scheme, authority, path, query, fragment } = uri;
        if (scheme) {
            parts.push(scheme, ':');
        }
        if (authority || scheme === 'file') {
            parts.push('//');
        }
        if (authority) {
            authority = authority.toLowerCase();
            let idx = authority.indexOf(':');
            if (idx === -1) {
                parts.push(encoder(authority));
            }
            else {
                parts.push(encoder(authority.substr(0, idx)), authority.substr(idx));
            }
        }
        if (path) {
            // lower-case windown drive letters in /C:/fff
            const m = URI._upperCaseDrive.exec(path);
            if (m) {
                path = m[1] + m[2].toLowerCase() + path.substr(m[1].length + m[2].length);
            }
            // encode every segement but not slashes
            // make sure that # and ? are always encoded
            // when occurring in paths - otherwise the result
            // cannot be parsed back again
            let lastIdx = 0;
            while (true) {
                let idx = path.indexOf(URI._slash, lastIdx);
                if (idx === -1) {
                    parts.push(encoder(path.substring(lastIdx)).replace(/[#?]/, _encode));
                    break;
                }
                parts.push(encoder(path.substring(lastIdx, idx)).replace(/[#?]/, _encode), URI._slash);
                lastIdx = idx + 1;
            }
            ;
        }
        if (query) {
            parts.push('?', encoder(query));
        }
        if (fragment) {
            parts.push('#', encoder(fragment));
        }
        return parts.join(URI._empty);
    }
    toJSON() {
        return {
            scheme: this.scheme,
            authority: this.authority,
            path: this.path,
            fsPath: this.fsPath,
            query: this.query,
            fragment: this.fragment,
            external: this.toString(),
            $mid: 1
        };
    }
}
URI._empty = '';
URI._slash = '/';
URI._regexp = /^(([^:/?#]+?):)?(\/\/([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?/;
URI._driveLetterPath = /^\/[a-zA-z]:/;
URI._upperCaseDrive = /^(\/)?([A-Z]:)/;
exports.default = URI;
//# sourceMappingURL=uri.js.map