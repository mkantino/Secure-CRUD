const express = require("express");
const mongoose = require("mongoose");

const router = express.Router();

const TaskSchema = new mongoose.Schema({
  title: { type: String, required: true },
  completed: { type: Boolean, default: false }
});

const Task = mongoose.model("Task", TaskSchema);

// CREATE
router.post("/tasks", async (req, res) => {
  const task = await Task.create(req.body);
  res.json(task);
});

// READ
router.get("/tasks", async (req, res) => {
  res.json(await Task.find());
});

// UPDATE
router.put("/tasks/:id", async (req, res) => {
  res.json(
    await Task.findByIdAndUpdate(req.params.id, req.body, { new: true })
  );
});

// DELETE
router.delete("/tasks/:id", async (req, res) => {
  await Task.findByIdAndDelete(req.params.id);
  res.json({ success: true });
});

module.exports = router;
