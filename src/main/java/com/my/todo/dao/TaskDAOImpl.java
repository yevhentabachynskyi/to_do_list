package com.my.todo.dao;

import com.my.todo.entity.Category;
import com.my.todo.entity.Task;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Repository
public class TaskDAOImpl implements TaskDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Task> getAllTasks() {
        Session session = sessionFactory.getCurrentSession();
        List<Task> allTasks = session.createQuery("from Task", Task.class).getResultList();
        return allTasks;
    }

    @Override
    public void saveTask(Task task) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(task);
    }

    @Override
    public Task getTask(int id) {
        Session session = sessionFactory.getCurrentSession();
        Task task = session.get(Task.class, id);
        return task;
    }
    @Override
    public Category getCategory(int id) {
        Session session = sessionFactory.getCurrentSession();
        Category category = session.get(Category.class, id);
        return category;
    }

    @Override
    public void deleteTask(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Task> query = session.createQuery("delete from Task where id =:taskId");
        query.setParameter("taskId", id);
        query.executeUpdate();
    }

    @Override
    public void doneTask(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Task> query = session.createQuery("update Task set state=true where id =:taskId");
        query.setParameter("taskId", id);
        query.executeUpdate();
    }

    @Override
    public List<Task> searchTask(String taskName) {
        Session session = sessionFactory.getCurrentSession();
        Query<Task> query = session.createQuery("from Task where task like :taskName");
        query.setParameter("taskName", "%" + taskName + "%");
        List<Task> searchTasks = query.getResultList();
        return searchTasks;
    }

    @Override
    public List<Task> todayTasks() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String currentDate = dateFormat.format(date);
        Session session = sessionFactory.getCurrentSession();
        Query<Task> query = session.createQuery("from Task where startDate like :currentDate");
        query.setParameter("currentDate",  "%" + currentDate + "%");
        List<Task> todayTasks = query.getResultList();
        return todayTasks;
    }

    @Override
    public List<Task> getCategoryTask(int idCategory) {
        Session session = sessionFactory.getCurrentSession();
        Query<Task> query = session.createQuery("from Task where category.idCategory =:idCategory");
        query.setParameter("idCategory", idCategory);
        List<Task> categoryTasks = query.getResultList();
        return categoryTasks;
    }

    @Override
    public List<Category> getAllCategory() {
        Session session = sessionFactory.getCurrentSession();
        List<Category> allCategory = session.createQuery("from Category", Category.class).getResultList();
        return allCategory;
    }
}
