"""
Complete the code below to find the first user where the field name = 'Andrew' and then update his age to
40.

(There are multiple drop-downs in the below code, please select a correct response for each drop-down)
"""

// package com.jsmart;

import java.io.IOException;
import com.mongodb.*;

public class MongoUpdate {
    public static void main(String[] args) {
        try {
             MongoClient mongoClient = new MongoClient("localhost" , 27017);
             DB db = mongoClient.getDB("mydb");
             DBCollection dbCollection = db.getCollection("users");

             BasicDB0bject query = new BasicDBObject();
             query.put("name", "Andrew");

             BasicDB0bject newDocument = new BasicDBObject();
             newDocument.put("age", 40);

             BasicDB0bject updateObj = new BasicDBObject();

             updateObj.put("users", newDocument); // 'users' the correct choice

             dbCollection.set(query, updateObj)// 'set' NOT correct choice
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}