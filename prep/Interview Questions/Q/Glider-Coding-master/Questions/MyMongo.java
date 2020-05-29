"""
Find a user with the field name = 'Andrew' and then delete him from the MyMongo collection.

(There are multiple drop-downs in the below code, please select a correct response for each drop-down)
"""
package com.jsmart;

import java.io.IOException;
import com.mongodb.*;

public class MyMongo{
    public static void main(String[] args) {
        try {
            MongoClient mongoClient = new MongoClient("localhost" , 27017);
            DB db = mongoClient.getDB("mydb");
            DBCollection dbCollection = db.getCollection("users");

            BasicDB0bject searchQuery = new BasicDBObject();

            searchQuery.put("name", "Andrew"); // `put` correct choice

            dbCollection.remove(searchQuery); // `remove` correct choice

        } catch (IOException e) {
            e.printStackTrace();
        }
}