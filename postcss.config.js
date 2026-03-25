module.exports = ctx => ({
  map: ctx.options.map,
  parser: ctx.options.parser,
  plugins: {
    "postcss-preset-env": {
      stage: 3,
      features: {
        "nesting-rules": true
      }
    },
    cssnano: ctx.env === "production" ? {} : false
  }
});
