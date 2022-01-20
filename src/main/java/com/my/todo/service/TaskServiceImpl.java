package com.my.todo.service;

import com.my.todo.dao.TaskDAO;
import com.my.todo.entity.Category;
import com.my.todo.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService{
    @Autowired
    private TaskDAO taskDAO;

    @Override
    @Transactional
    public List<Task> getAllTasks() {
        return taskDAO.getAllTasks();
    }

    @Override
    @Transactional
    public void saveTask(Task task) {
        taskDAO.saveTask(task);
    }

    @Override
    @Transactional
    public Task getTask(int id) {
        return taskDAO.getTask(id);
    }

    @Override
    @Transactional
    public Category getCategory(int id) {
        return taskDAO.getCategory(id);
    }

    @Override
    @Transactional
    public void deleteTask(int id) {
        taskDAO.deleteTask(id);
    }

    @Override
    @Transactional
    public void doneTask(int id) {
        taskDAO.doneTask(id);
    }

    @Override
    @Transactional
    public List<Task> searchTask(String taskName) {
       return taskDAO.searchTask(taskName);
    }

    @Override
    @Transactional
    public List<Task> todayTasks() {
        return taskDAO.todayTasks();
    }

    @Override
    @Transactional
    public List<Task> getCategoryTask(int idCategory) {
        return taskDAO.getCategoryTask(idCategory);
    }

    @Override
    @Transactional
    public List<Category> getAllCategory() {
        return taskDAO.getAllCategory();
    }
}
