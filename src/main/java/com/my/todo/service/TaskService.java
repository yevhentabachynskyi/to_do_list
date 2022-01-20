package com.my.todo.service;

import com.my.todo.entity.Category;
import com.my.todo.entity.Task;

import java.util.List;

public interface TaskService {
    public List<Task> getAllTasks();
    public void saveTask(Task task);
    public Task getTask(int id);
    public Category getCategory(int id);
    public void deleteTask(int id);
    public void doneTask(int id);
    public List<Task> searchTask(String taskName);
    public List<Task> todayTasks();
    public List<Task> getCategoryTask(int idCategory);
    public List<Category> getAllCategory();
}
