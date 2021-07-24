/*
 * Created: 03-22-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package model.shop;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    //init cart
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    private Item getItemById(int id) {
        for (Item item : items) {
            if (item.getCourse().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(Item i) {
        if (getItemById(i.getCourse().getId()) != null) {
        } else {
            items.add(i);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public float getTotalMoney() {
        float money = 0;
        for (Item item : items) {
            money += item.getCourse().getFee();
        }
        return money;
    }
}
