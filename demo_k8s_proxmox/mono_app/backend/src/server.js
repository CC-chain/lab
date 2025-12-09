const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;
const MESSAGE = process.env.MESSAGE || "Hello from backend!";

app.get("/healthz", (req, res) => {
  res.json({ status: "ok" });
});


app.get("/api/message", (req, res) => {
  res.json({
    message: MESSAGE,
    time: new Date().toISOString(),
  });
});

app.get("/", (req, res) => {
  res.send("Backend is up and running");
});

app.listen(PORT, () => {
  console.log(`Backend listening on port ${PORT}`);
});
