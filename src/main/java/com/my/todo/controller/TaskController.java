package com.my.todo.controller;

import com.my.todo.entity.Category;
import com.my.todo.entity.Task;
import com.my.todo.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TaskController {

    @Autowired
    private TaskService taskService;

    @RequestMapping("/")
    public String showAllTask(Model model){
        List<Task> allTasksList = taskService.getAllTasks();
        model.addAttribute("allTasks", allTasksList);
        getAllCategory(model);
        return "all-tasks";
    }

    @RequestMapping("/addNewTask")
    public String addNewTask(Model model) {
        Category category = new Category();
        Task task = new Task();
        task.setCategory(category);
        getAllCategory(model);
        model.addAttribute("taskToDo", task);
        return "task-info";
    }

    @RequestMapping("/saveTask")
    public String saveTask(@ModelAttribute("taskToDo") Task task) {
        taskService.saveTask(task);
        return "redirect:/";
    }

    @RequestMapping("/updateInfo")
    public String updateTask(@RequestParam("taskId") int id, Model model) {
        Task task = taskService.getTask(id);
        model.addAttribute("taskToDo", task);
        getAllCategory(model);
        return "task-info";
    }

    @RequestMapping("/deleteTask")
    public String deleteTask(@RequestParam("taskId") int id) {
        taskService.deleteTask(id);
        return "redirect:/";
    }

    @RequestMapping("/doneTask")
    public String doneTask(@RequestParam("taskId") int id) {
        taskService.doneTask(id);
        return "redirect:/";
    }

    @RequestMapping("/searchTask")
    public String doneTask(@RequestParam("taskName") String taskName, Model model) {
        List<Task> searchTasksList = taskService.searchTask(taskName);
        model.addAttribute("allTasks", searchTasksList);
        getAllCategory(model);
        return "all-tasks";
    }

    @RequestMapping("/todayTask")
    public String todayTask(Model model) {
        List<Task> todayTasksList = taskService.todayTasks();
        model.addAttribute("allTasks", todayTasksList);
        getAllCategory(model);
        return "all-tasks";
    }
    @RequestMapping("/getCategoryTask")
    public String getCategoryTask(@RequestParam("idCategory") int idCategory, Model model) {
        List<Task> categoryTasksList = taskService.getCategoryTask(idCategory);
        model.addAttribute("allTasks", categoryTasksList);
        getAllCategory(model);
        return "all-tasks";
    }
    public void getAllCategory(Model model) {
        List<Category> allCategory = taskService.getAllCategory();
        model.addAttribute("allCategories", allCategory);
    }
}
 