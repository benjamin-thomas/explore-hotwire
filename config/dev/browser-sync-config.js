// https://github.com/thelucid/browsersyncing-rails/blob/main/lib/install/bs-config.js
module.exports = {
    proxy: {
        target: "localhost:3000",
        proxyReq: [
            // Authenticity token form submissions.
            (proxyReq) => proxyReq.setHeader('X-Forwarded-Host', 'localhost:4000')
        ],
    },
    port: 4000,
    ui: { port: 4001 },
    files: ['app/assets', 'app/views'],
    open: false,
    notify: false,
    snippetOptions: {
        rule: {
            // Add to head as turbo replaces body.
            match: /<\/head>/i,
            fn: (snippet, match) => snippet + match
        }
    }
};
