Awk stands for the names of its authors “Aho, Weinberger, and Kernighan”.

Some of the key features of Awk are:

    Awk views a text file as records and fields.
    Like common programming language, Awk has variables, conditionals and loops
    Awk has arithmetic and string operators.
    Awk can generate formatted reports
Awk reads from a file or from its standard input, and outputs to its standard output

FILE NAME IS E:

adish007@ADISH007:~$ cat e
Amit manager account 45000

Rohit clerk account 25000

Piyush manager sales 50000

Rahul manager account 47000

Sreenu peon sales 15000

Bikesh clerk sales 23000

Sreejit peon sales 13000

Aniket director purchase 80000

1.TO LOOK AT WHAT IS WRITTEN IN FILE:

adish007@ADISH007:~$ awk '{print}' e
Amit manager account 45000

Rohit clerk account 25000

Piyush manager sales 50000

Rahul manager account 47000

Sreenu peon sales 15000

Bikesh clerk sales 23000

Sreejit peon sales 13000

Aniket director purchase 80000

2.PATTERN MATCH PRINTING

adish007@ADISH007:~$ awk '/peon/{print}' e
Sreenu peon sales 15000
Sreejit peon sales 13000

3.SPLITTING OF LINES INTO FIELDS

adish007@ADISH007:~$ awk '{print $1,$4}' e
Amit 45000
 
Rohit 25000
 
Piyush 50000
 
Rahul 47000
 
Sreenu 15000
 
Bikesh 23000
 
Sreejit 13000
 
Aniket 80000

adish007@ADISH007:~$ awk '{print $0}' e
Amit manager account 45000

Rohit clerk account 25000

Piyush manager sales 50000

Rahul manager account 47000

Sreenu peon sales 15000

Bikesh clerk sales 23000

Sreejit peon sales 13000

Aniket director purchase 80000
-------------------------------------------------------------------------------------------
NR: NR command keeps a current count of the number of input records
--------------------------------------------------------------------------------------------
NF: NF command keeps a count of the number of fields within the current input record.
--------------------------------------------------------------------------------------------
FS: FS command contains the field separator character which is used to divide fields on the input line. The default is “white space”
-----------------------------------------------------------------------------------------------------------------------------------
RS: RS command stores the current record separator character.default record separator character is a newline.
-----------------------------------------------------------------------------------------------------------------
4.USING NR TO DISPLAY LINE NUMBERS

adish007@ADISH007:~$ awk '{print NR $0}' e
1Amit manager account 45000
2
3Rohit clerk account 25000
4
5Piyush manager sales 50000
6
7Rahul manager account 47000
8
9Sreenu peon sales 15000
10
11Bikesh clerk sales 23000
12
13Sreejit peon sales 13000
14
15Aniket director purchase 80000

5.NF usage:

adish007@ADISH007:~$ awk '{print $NF}' e
45000

25000

50000

47000

15000

23000

13000

80000

adish007@ADISH007:~$ awk '{print $1,$2,$NF}' e
Amit manager 45000
  
Rohit clerk 25000
  
Piyush manager 50000
  
Rahul manager 47000
  
Sreenu peon 15000
  
Bikesh clerk 23000
  
Sreejit peon 13000
  
Aniket director 80000


6.TO DISPLAY LINE  FROM A GIVEN RANGE USING NR

adish007@ADISH007:~$ awk 'NR==3,NR==6 {print NR $0}' e
3Rohit clerk account 25000
4
5Piyush manager sales 50000
6

7.NR USAGES:

1.JOIN FIRST FIELD WITH LINE NUMBER USING '=='

  adish007@ADISH007:~$ awk '{print NR "==" $1}' e
  1==Amit
  2==
  3==Rohit
  4==
  5==Piyush
  6==
  7==Rahul
  8==
  9==Sreenu
  10==
  11==Bikesh
  12==
  13==Sreejit
  14==
  15==Aniket

2.USING NF:
  1.TO PRINT NON EMPTY FIELDS IN A LINE
  
  adish007@ADISH007:~$ awk 'NF>0' e
Amit manager account 45000
Rohit clerk account 25000
Piyush manager sales 50000
Rahul manager account 47000
Sreenu peon sales 15000
Bikesh clerk sales 23000
Sreejit peon sales 13000
Aniket director purchase 80000
  2.TO PRINT LINE NUMBERS ALONG WITH NON EMPTY FIELDS IN A LINE.
  
  adish007@ADISH007:~$ awk 'NF>0 {print NR $0}' e
1Amit manager account 45000
3Rohit clerk account 25000
5Piyush manager sales 50000
7Rahul manager account 47000
9Sreenu peon sales 15000
11Bikesh clerk sales 23000
13Sreejit peon sales 13000
15Aniket director purchase 80000

8.TO FIND THE LENGTH OF THE LONGEST LINE USING AWK

adish007@ADISH007:~$ awk '{ if(length($0)>m) m=length($0) } END{print m}' e
30

9.TO COUNT THE LINES IN A FILE

adish007@ADISH007:~$ awk 'END {print NR}' e
15

10.IF A STRING MATCHES TO A FIELD ,THEN PRINT THE ENTIRE LINE

adish007@ADISH007:~$ awk '{ if( $3 == "sales" ) print $0}' e


Piyush manager sales 50000
Sreenu peon sales 15000
Bikesh clerk sales 23000
Sreejit peon sales 13000

11.TO FIND THE SQUARES OF NUMBERS USING AWK

adish007@ADISH007:~$ awk 'BEGIN { for(i=1;i<=6;i++) print "square is "i*i}'
square is 1
square is 4
square is 9
square is 16
square is 25
square is 36

12.TO FIND THE CUBE OF NUMBERS USING AWK

adish007@ADISH007:~$ awk 'BEGIN{for(i==1;i<=10;i++) print "cube is " i*i*i}' 
cube is 0
cube is 1
cube is 8
cube is 27
cube is 64
cube is 125
cube is 216
cube is 343
cube is 512
cube is 729
cube is 1000

13.TO PRINT 10 RANDOM NUMBERS USING AWK

adish007@ADISH007:~$ awk 'BEGIN{for(i==1;i<=10;i++) print "random number is " int(100*rand())}' 
random number is 62
random number is 81
random number is 94
random number is 16
random number is 45
random number is 65
random number is 45
random number is 5
random number is 71
random number is 27
random number is 72

AWK CONTROL FLOW
--------------------------------
AWK provides conditional statements to control the flow of a program. 

1.IF STATEMENT

    adish007@ADISH007:~$ awk 'BEGIN{n=10;if(n%2==0) printf "%d is even\n",n}'
    10 is even
2.IF ELSE STATEMENT

    adish007@ADISH007:~$ awk 'BEGIN {n=10;if(n%2==0) printf "%d is even\n",n;else printf "%d is not even\n",n}'
    10 is even
    adish007@ADISH007:~$ awk 'BEGIN {n=11;if(n%2==0) printf "%d is even\n",n;else printf "%d is not even\n",n}'
    11 is not even
3.IF ELSE IF LADDER
    adish007@ADISH007:~$ awk 'BEGIN { n=1; if(n==1) print "criz" ; else if (n==2) print "npk" ;else if (n==3) print "unknown"}'
    criz
    adish007@ADISH007:~$ awk 'BEGIN { n=2; if(n==1) print "criz" ; else if (n==2) print "npk" ;else if (n==3) print "unknown"}'
    npk
    adish007@ADISH007:~$ awk 'BEGIN { n=3; if(n==1) print "criz" ; else if (n==2) print "npk" ;else if (n==3) print "unknown"}'
    unknown
    
AWK ARRAY
--------------------------------------------------------
AWK has associative arrays and one of the best thing about it is – the indexes need not to be continuous set of number; 
you can use either string or number as an array index. 
Also, there is no need to declare the size of an array in advance – arrays can expand/shrink at runtime.    

1.CREATING AN ARRAY

adish007@ADISH007:~$ awk 'BEGIN { a["x"]="criz";a["y"]="npk";a["z"]="bala";print a["x"] "\n" a["y"] "\n" a["z"] }'
criz
npk
bala

2.DELETING AN ELEMENT OF AN ARRAY

adish007@ADISH007:~$ awk 'BEGIN { a["x"]="criz";a["y"]="npk";a["z"]="bala";delete a["x"];print a["x"] }'

adish007@ADISH007:~$ awk 'BEGIN { a["x"]="criz";a["y"]="npk";a["z"]="bala";print a["x"] }'
criz

3.SIMULATION OF MULTIDIMENSIONAL ARRAY USING 1-D ARRAY

adish007@ADISH007:~$ awk 'BEGIN { a[0,0]="criz";a[0,1]="npk";a[0,2]="bala";a[1,0]="vg";a[1,1]="muhs";a[1,2]="reppan";print a[1,2] }'
reppan
adish007@ADISH007:~$ awk 'BEGIN { a[0,0]="criz";a[0,1]="npk";a[0,2]="bala";a[1,0]="vg";a[1,1]="muhs";a[1,2]="reppan";print a[1,1] }'
muhs
adish007@ADISH007:~$ awk 'BEGIN { a[0,0]="criz";a[0,1]="npk";a[0,2]="bala";a[1,0]="vg";a[1,1]="muhs";a[1,2]="reppan";print a[1,0] }'
vg
adish007@ADISH007:~$ awk 'BEGIN { a[0,0]="criz";a[0,1]="npk";a[0,2]="bala";a[1,0]="vg";a[1,1]="muhs";a[1,2]="reppan";print a[0,0] }'
criz
adish007@ADISH007:~$ awk 'BEGIN { a[0,0]="criz";a[0,1]="npk";a[0,2]="bala";a[1,0]="vg";a[1,1]="muhs";a[1,2]="reppan";print a[0,1] }'
npk
adish007@ADISH007:~$ awk 'BEGIN { a[0,0]="criz";a[0,1]="npk";a[0,2]="bala";a[1,0]="vg";a[1,1]="muhs";a[1,2]="reppan";print a[0,2] }'
bala

   

