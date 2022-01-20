package com.my.todo.entity;



import org.apache.taglibs.standard.lang.jstl.ELException;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tasks")
public class Task implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "task")
    private String task;

    @Column(name = "importance")
    private String importance;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "complete_date")
    private String completeDate;

    @Column(name = "state")
    private boolean state;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    public Task() {
    }

    public Task(String task, String importance, String startDate, String completeDate, boolean state, Category category) {
        this.task = task;
        this.importance = importance;
        this.startDate = startDate;
        this.completeDate = completeDate;
        this.state = state;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getImportance() {
        return importance;
    }

    public void setImportance(String importance) {
        this.importance = importance;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getCompleteDate() {
        return completeDate;
    }

    public void setCompleteDate(String completeDate) {
        this.completeDate = completeDate;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getIdCategory() {
       return category.getIdCategory();
    }
    public String getCategoryName(){
        return category.getCategoryName();
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", task='" + task + '\'' +
                ", importance='" + importance + '\'' +
                ", startDate='" + startDate + '\'' +
                ", completeDate='" + completeDate + '\'' +
                ", state=" + state +
                ", category=" + category +
                '}';
    }
}
