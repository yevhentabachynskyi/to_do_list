package com.my.todo.entity;

import org.springframework.transaction.annotation.EnableTransactionManagement;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "categories")

public class Category implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int idCategory;

    @Column(name = "category")
    private String categoryName;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "category")
   // @JoinColumn(name = "id")
    private Set<Task> tasksCategory;

    public Category() {
    }

    public Category(String categoryName, Set<Task> setTasks) {
        this.categoryName = categoryName;
        this.tasksCategory = setTasks;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Set<Task> getTasksCategory() {
        return tasksCategory;
    }

    public void setTasksCategory(Set<Task> tasksCategory) {
        this.tasksCategory = tasksCategory;
    }

    @Override
    public String toString() {
        return "Category{" +
                "idCategory=" + idCategory +
                ", categoryName='" + categoryName + '\'' +
                ", tasksCategory=" + tasksCategory +
                '}';
    }
}
