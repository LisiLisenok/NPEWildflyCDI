
NPE occurs when some class which takes optional argument is instantiated.  

### How to run

1. Compile Ceylon module using
	`ceylon compile npewildflycdi`
2. Assembly .war with
	`ceylon war npewildflycdi -R webapp --static-metamodel`
3. Run assembled .war with Wildfly
4. Open in web-browser http://127.0.0.1:8080/npewildflycdi-1.0.0
