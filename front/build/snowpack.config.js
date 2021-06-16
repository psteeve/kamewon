const httpProxy = require('http-proxy');
const proxy = httpProxy.createServer({ target: 'http://localhost:4110' });

module.exports = {
  experiments: {
    routes: [
      {
        src: '/api/.*',
        dest: (req, res) => proxy.web(req, res),
      },
    ],
  },
};
