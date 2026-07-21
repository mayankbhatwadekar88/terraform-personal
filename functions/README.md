# Functions

# Lookup

lookup(map, key, default)-> This will retrieve the value of a single element from a map based on the key. If the given key does not exist, it will return default value instead.
For example- 
> lookup({a="ay", b="bee"}, "a", "what?")
    ay
> lookup({a="ay", b="bee"}, "c", "what?")
what?
Similarly in our project, lookup(var.amis, var.region) will retrieve the ami based on the region. So if,

amis = {
  "us-east-2" = "ami-078fe7ff43e10cf8c"
  "us-west-1" = "ami-0258f6159529e6b5b"
  "us-west-2" = "ami-071d641d6d46d34f8"
}

and 

region = "us-east-2"

This will give the output as ami-078fe7ff43e10cf8c

# length

length determines the length of a given list, map, or string.
In our example, length(var.tags) and tags = [ "firstec2", "second-ec2" ]. So the output will be 2.

# element

element(list, index)-> Retrieves a single element from the list with zero based index.
For example- > 
>>element(["a", "b", "c"], 1)
"b"
In our case, element(var.tags, count.index), where tags = [ "firstec2", "second-ec2" ]. count.index will be 0 in the first loop and 1 in the second loop. So it will iterate 2 times and create 2 resources with the names firstec2 and second-ec2.

# timestamp()

This function is intended for producing common machine-oriented timestamp formats such as those defined in RFC822, RFC850, and RFC1123.

# formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())

This function will generate today's date and time with the format formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")

