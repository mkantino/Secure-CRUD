const express = require("express");
require("./db");

const routes = require("./routes");

const app = express();
app.use(express.json());

app.use("/api", routes);

app.listen(5000, () => {
  console.log("Application running on port 5000");
});
