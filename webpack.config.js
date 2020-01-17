const webpack = require("webpack");
const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  entry: {
    profanity: ["./src/scss/profanity.scss"]
  },
  output: {
    path: path.resolve(__dirname, "css"),
    filename: "[name].js"
  },
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              url: url => {
                if (url.includes(".png") || url.includes(".svg")) {
                  return false;
                }

                return true;
              }
            }
          },
          "postcss-loader",
          {
            loader: "sass-loader",
            options: {
              sassOptions: {
                fiber: false
              }
            }
          }
        ]
      },
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "postcss-loader"]
      },
      {
        test: /\.png$/,
        use: [
          {
            loader: "url-loader",
            options: {
              mimetype: "image/png"
            }
          }
        ]
      },
      {
        test: /\.svg$/,
        use: "file-loader"
      }
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      "process.env.NODE_ENV": process.env.NODE_ENV
    }),
    new MiniCssExtractPlugin()
  ]
};
