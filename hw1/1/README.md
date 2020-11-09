# Problem 

Tagged languages like HTML can be more interesting to parse. Suggest
how to tokenize the following snippet of HTML code. Which lexemes should get lexical
values? What should the values be? Write the flex specification of your solution.
```
<p>Links can be added with the <tt>a</ tt> tag .
<a href=” http ://www. w3schools . com/html/ d e f a u l t . asp ”>
This</a> i s a l i n k to w3 s c h o o l s . I t i s an e x c e l l e n t t o o l
when working with web pages .
Put in a l i n k to your f a v o r i t e s p o r t s team ,
movie , recipe , etc .</p>
<p>You can a l s o post code o n l i n e using the <tt>code</ tt>
and <tt>pre</ tt> tags . Make sure to wrap
<tt>pre</ tt> i n s i d e <tt>code</ tt> l i k e t h i s example :</p>
```
