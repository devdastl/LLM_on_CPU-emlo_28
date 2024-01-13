### Example:1
#### Input: 
man name Josh has a car from ford company it was launchd on year 1994; josn:

#### Generated output
```
man name Josh has a car from ford company it was launchd on year 1994; josn:{ "car": 

   { "make": "Ford", "model":"Mondeo","year":2086,"colors": ["blue"]},
     "owner":{"firstName":"Josh ","lastName":"Cox}",
          "age":37}} [end of text]

```
#### Grammer file
```
root ::= CarAndOwner
Owner ::= "{"   ws   "\"firstName\":"   ws   string   ","   ws   "\"lastName\":"   ws   string   ","   ws   "\"age\":"   ws   number   "}"
Ownerlist ::= "[]" | "["   ws   Owner   (","   ws   Owner)*   "]"
Car ::= "{"   ws   "\"make\":"   ws   string   ","   ws   "\"model\":"   ws   string   ","   ws   "\"year\":"   ws   number   ","   ws   "\"colors\":"   ws   stringlist   "}"
Carlist ::= "[]" | "["   ws   Car   (","   ws   Car)*   "]"
CarAndOwner ::= "{"   ws   "\"car\":"   ws   Car   ","   ws   "\"owner\":"   ws   Owner   "}"
CarAndOwnerlist ::= "[]" | "["   ws   CarAndOwner   (","   ws   CarAndOwner)*   "]"
string ::= "\""   ([^"]*)   "\""
boolean ::= "true" | "false"
ws ::= [ \t\n]*
number ::= [0-9]+   "."?   [0-9]*
stringlist ::= "["   ws   "]" | "["   ws   string   (","   ws   string)*   ws   "]"
numberlist ::= "["   ws   "]" | "["   ws   string   (","   ws   number)*   ws   "]"

```

### Example:2
#### Input:
David age 12 and Josh age 13 from Thomas-school. Both scored 100 in Math and English; josn:
#### Generated output:
```
David age 12 and Josh age 13 from Thomas-school. Both scored 100 in Math and English; josn:{        "name": "Josh",

    "students": [
       {  "name":"Joan ",
          "age":58,
           "grades": {  "Math":93,   "English":102,"Science":64}},           {"name":"John",
         "age":7.5, "grades":{"Math":    92,      "English":82,       "Science":          6}}]}
```
#### Grammer file

```
root ::= School
Grade ::= "{"   ws   "\"Math\":"   ws   number   ","   ws   "\"English\":"   ws   number   ","   ws   "\"Science\":"   ws   number   "}"
Gradelist ::= "[]" | "["   ws   Grade   (","   ws   Grade)*   "]"
Student ::= "{"   ws   "\"name\":"   ws   string   ","   ws   "\"age\":"   ws   number   ","   ws   "\"grades\":"   ws   Grade   "}"
Studentlist ::= "[]" | "["   ws   Student   (","   ws   Student)*   "]"
School ::= "{"   ws   "\"name\":"   ws   string   ","   ws   "\"students\":"   ws   Studentlist   "}"
Schoollist ::= "[]" | "["   ws   School   (","   ws   School)*   "]"
string ::= "\""   ([^"]*)   "\""
boolean ::= "true" | "false"
ws ::= [ \t\n]*
number ::= [0-9]+   "."?   [0-9]*
stringlist ::= "["   ws   "]" | "["   ws   string   (","   ws   string)*   ws   "]"
numberlist ::= "["   ws   "]" | "["   ws   string   (","   ws   number)*   ws   "]"

```