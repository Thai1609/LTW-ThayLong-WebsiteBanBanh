package vn.edu.hcmuaf.nlu.Model;

import java.util.Collection;
import java.util.HashMap;

public class Cart {
    HashMap<Integer, Products> listCart;

    public Cart() {
        this.listCart = new HashMap<>();
    }

    public Products get(int id) {
        return listCart.get(id);
    }

    public int put(Products item) {
        if (listCart.containsKey(item.getId())) {
            listCart.get(item.getId()).quantityUp();
        } else {
            listCart.put(item.getId(), item);
        }
        return listCart.get(item.getId()).getQuantity();
    }

    public int put(int id, int quantity) {
        if (listCart.containsKey(id)) {
            listCart.get(id).quantityUp();
        }
        return listCart.get(id).getQuantity();
    }

    //
    public boolean remove(int id) {
        return listCart.remove(id)==null;
    }
    //
    public int quantity() {
        int sum = 0;
        for (Products p : listCart.values()) {
            sum += p.getQuantity();
        }
        return sum;
    }

    public double total() {
        double sum = 0;
        for (Products p : listCart.values()) {
            sum += (p.getQuantity() * p.getUnit_price());
        }
        return sum;
    }

    public Collection<Products> list() {
        return listCart.values();
    }
}
