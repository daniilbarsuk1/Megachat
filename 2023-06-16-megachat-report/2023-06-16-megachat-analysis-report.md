# Code analysis
## megachat 
#### Version 0.0.1-SNAPSHOT 

**By: Administrator**

*Date: 2023-06-16*

## Introduction
This document contains results of the code analysis of megachat

Chat application

## Configuration

- Quality Profiles
    - Names: Sonar way [Java]; Sonar way [XML]; 
    - Files: AYjEI4WgUMY6zXrqjMqW.json; AYjEI4aqUMY6zXrqjM2U.json; 


 - Quality Gate
    - Name: Sonar way
    - File: Sonar way.xml

## Synthesis

### Analysis Status

Reliability | Security | Security Review | Maintainability |
:---:|:---:|:---:|:---:
C | A | A | A |

### Quality gate status

| Quality Gate Status | OK |
|-|-|



### Metrics

Coverage | Duplications | Comment density | Median number of lines of code per file | Adherence to coding standard |
:---:|:---:|:---:|:---:|:---:
0.0 % | 0.0 % | 1.3 % | 29.0 | 99.8 %

### Tests

Total | Success Rate | Skipped | Errors | Failures |
:---:|:---:|:---:|:---:|:---:
1 | 100.0 % | 0 | 0 | 0

### Detailed technical debt

Reliability|Security|Maintainability|Total
---|---|---|---
0d 0h 20min|-|0d 0h 25min|0d 0h 45min


### Metrics Range

\ | Cyclomatic Complexity | Cognitive Complexity | Lines of code per file | Coverage | Comment density (%) | Duplication (%)
:---|:---:|:---:|:---:|:---:|:---:|:---:
Min | 1.0 | 0.0 | 9.0 | 0.0 | 0.0 | 0.0
Max | 14.0 | 1.0 | 110.0 | 0.0 | 4.3 | 0.0

### Volume

Language|Number
---|---
Java|110
XML|38
Total|148


## Issues

### Issues count by severity and types

Type / Severity|INFO|MINOR|MAJOR|CRITICAL|BLOCKER
---|---|---|---|---|---
BUG|0|0|2|0|0
VULNERABILITY|0|0|0|0|0
CODE_SMELL|0|0|2|0|1


### Issues List

Name|Description|Type|Severity|Number
---|---|---|---|---
Null pointers should not be dereferenced|A reference to null should never be dereferenced/accessed. Doing so will cause a NullPointerException to be thrown. At <br /> best, such an exception will cause abrupt program termination. At worst, it could expose debugging information that would be useful to an attacker, or <br /> it could allow an attacker to bypass security measures. <br /> Note that when they are present, this rule takes advantage of @CheckForNull and @Nonnull annotations defined in JSR-305 to understand which values are and are not nullable except when @Nonnull is used <br /> on the parameter to equals, which by contract should always work with null. <br /> Noncompliant Code Example <br />  <br /> @CheckForNull <br /> String getName(){...} <br />  <br /> public boolean isNameEmpty() { <br />   return getName().length() == 0; // Noncompliant; the result of getName() could be null, but isn't null-checked <br /> } <br />  <br />  <br /> Connection conn = null; <br /> Statement stmt = null; <br /> try{ <br />   conn = DriverManager.getConnection(DB_URL,USER,PASS); <br />   stmt = conn.createStatement(); <br />   // ... <br />  <br /> }catch(Exception e){ <br />   e.printStackTrace(); <br /> }finally{ <br />   stmt.close();   // Noncompliant; stmt could be null if an exception was thrown in the try{} block <br />   conn.close();  // Noncompliant; conn could be null if an exception was thrown <br /> } <br />  <br />  <br /> private void merge(@Nonnull Color firstColor, @Nonnull Color secondColor){...} <br />  <br /> public  void append(@CheckForNull Color color) { <br />     merge(currentColor, color);  // Noncompliant; color should be null-checked because merge(...) doesn't accept nullable parameters <br /> } <br />  <br />  <br /> void paint(Color color) { <br />   if(color == null) { <br />     System.out.println("Unable to apply color " + color.toString());  // Noncompliant; NullPointerException will be thrown <br />     return; <br />   } <br />   ... <br /> } <br />  <br /> See <br />  <br />    MITRE, CWE-476 - NULL Pointer Dereference  <br />    CERT, EXP34-C. - Do not dereference null pointers  <br />    CERT, EXP01-J. - Do not use a null in a case where an object is required  <br /> |BUG|MAJOR|2
Tests should include assertions|A test case without assertions ensures only that no exceptions are thrown. Beyond basic runnability, it ensures nothing about the behavior of the <br /> code under test. <br /> This rule raises an exception when no assertions from any of the following known frameworks are found in a test: <br />  <br />    AssertJ  <br />    Awaitility  <br />    EasyMock  <br />    Eclipse Vert.x  <br />    Fest 1.x and 2.x  <br />    Hamcrest  <br />    JMock  <br />    JMockit  <br />    JUnit  <br />    Mockito  <br />    Rest-assured 2.x, 3.x and 4.x  <br />    RxJava 1.x and 2.x  <br />    Selenide  <br />    Spring’s org.springframework.test.web.servlet.ResultActions.andExpect() and <br />   org.springframework.test.web.servlet.ResultActions.andExpectAll()  <br />    Truth Framework  <br />    WireMock  <br />  <br /> Furthermore, as new or custom assertion frameworks may be used, the rule can be parametrized to define specific methods that will also be <br /> considered as assertions. No issue will be raised when such methods are found in test cases. The parameter value should have the following format <br /> &lt;FullyQualifiedClassName&gt;#&lt;MethodName&gt;, where MethodName can end with the wildcard character. For constructors, <br /> the pattern should be &lt;FullyQualifiedClassName&gt;#&lt;init&gt;. <br /> Example:&nbsp;com.company.CompareToTester#compare*,com.company.CustomAssert#customAssertMethod,com.company.CheckVerifier#&lt;init&gt;. <br /> Noncompliant Code Example <br />  <br /> @Test <br /> public void testDoSomething() {  // Noncompliant <br />   MyClass myClass = new MyClass(); <br />   myClass.doSomething(); <br /> } <br />  <br /> Compliant Solution <br /> Example when com.company.CompareToTester#compare* is used as parameter to the rule. <br />  <br /> import com.company.CompareToTester; <br />  <br /> @Test <br /> public void testDoSomething() { <br />   MyClass myClass = new MyClass(); <br />   assertNull(myClass.doSomething());  // JUnit assertion <br />   assertThat(myClass.doSomething()).isNull();  // Fest assertion <br /> } <br />  <br /> @Test <br /> public void testDoSomethingElse() { <br />   MyClass myClass = new MyClass(); <br />   new CompareToTester().compareWith(myClass);  // Compliant - custom assertion method defined as rule parameter <br />   CompareToTester.compareStatic(myClass);  // Compliant <br /> } <br /> |CODE_SMELL|BLOCKER|1
"Preconditions" and logging arguments should not require evaluation|Passing message arguments that require further evaluation into a Guava com.google.common.base.Preconditions check can result in a <br /> performance penalty. That’s because whether or not they’re needed, each argument must be resolved before the method is actually called. <br /> Similarly, passing concatenated strings into a logging method can also incur a needless performance hit because the concatenation will be performed <br /> every time the method is called, whether or not the log level is low enough to show the message. <br /> Instead, you should structure your code to pass static or pre-computed values into Preconditions conditions check and logging <br /> calls. <br /> Specifically, the built-in string formatting should be used instead of string concatenation, and if the message is the result of a method call, <br /> then Preconditions should be skipped altogether, and the relevant exception should be conditionally thrown instead. <br /> Noncompliant Code Example <br />  <br /> logger.log(Level.DEBUG, "Something went wrong: " + message);  // Noncompliant; string concatenation performed even when log level too high to show DEBUG messages <br />  <br /> logger.fine("An exception occurred with message: " + message); // Noncompliant <br />  <br /> LOG.error("Unable to open file " + csvPath, e);  // Noncompliant <br />  <br /> Preconditions.checkState(a &gt; 0, "Arg must be positive, but got " + a);  // Noncompliant. String concatenation performed even when a &gt; 0 <br />  <br /> Preconditions.checkState(condition, formatMessage());  // Noncompliant. formatMessage() invoked regardless of condition <br />  <br /> Preconditions.checkState(condition, "message: %s", formatMessage());  // Noncompliant <br />  <br /> Compliant Solution <br />  <br /> logger.log(Level.SEVERE, "Something went wrong: {0} ", message);  // String formatting only applied if needed <br />  <br /> logger.fine("An exception occurred with message: {}", message);  // SLF4J, Log4j <br />  <br /> logger.log(Level.SEVERE, () -&gt; "Something went wrong: " + message); // since Java 8, we can use Supplier , which will be evaluated lazily <br />  <br /> LOG.error("Unable to open file {0}", csvPath, e); <br />  <br /> if (LOG.isDebugEnabled()) { <br />   LOG.debug("Unable to open file " + csvPath, e);  // this is compliant, because it will not evaluate if log level is above debug. <br /> } <br />  <br /> Preconditions.checkState(arg &gt; 0, "Arg must be positive, but got %d", a);  // String formatting only applied if needed <br />  <br /> if (!condition) { <br />   throw new IllegalStateException(formatMessage());  // formatMessage() only invoked conditionally <br /> } <br />  <br /> if (!condition) { <br />   throw new IllegalStateException("message: " + formatMessage()); <br /> } <br />  <br /> Exceptions <br /> catch blocks are ignored, because the performance penalty is unimportant on exceptional paths (catch block should not be a part of <br /> standard program flow). Getters are ignored as well as methods called on annotations which can be considered as getters. This rule accounts for <br /> explicit test-level testing with SLF4J methods isXXXEnabled and ignores the bodies of such if statements.|CODE_SMELL|MAJOR|1
Printf-style format strings should be used correctly|Because printf-style format strings are interpreted at runtime, rather than validated by the compiler, they can contain errors that <br /> result in the wrong strings being created. This rule statically validates the correlation of printf-style format strings to their <br /> arguments when calling the format(...) methods of java.util.Formatter, java.lang.String, <br /> java.io.PrintStream, MessageFormat, and java.io.PrintWriter classes and the printf(...) methods of <br /> java.io.PrintStream or java.io.PrintWriter classes. <br /> Noncompliant Code Example <br />  <br /> String.format("First {0} and then {1}", "foo", "bar");  //Noncompliant. Looks like there is a confusion with the use of {{java.text.MessageFormat}}, parameters "foo" and "bar" will be simply ignored here <br /> String.format("Display %3$d and then %d", 1, 2, 3);   //Noncompliant; the second argument '2' is unused <br /> String.format("Too many arguments %d and %d", 1, 2, 3);  //Noncompliant; the third argument '3' is unused <br /> String.format("First Line\n");   //Noncompliant; %n should be used in place of \n to produce the platform-specific line separator <br /> String.format("Is myObject null ? %b", myObject);   //Noncompliant; when a non-boolean argument is formatted with %b, it prints true for any nonnull value, and false for null. Even if intended, this is misleading. It's better to directly inject the boolean value (myObject == null in this case) <br /> String.format("value is " + value); // Noncompliant <br /> String s = String.format("string without arguments"); // Noncompliant <br />  <br /> MessageFormat.format("Result '{0}'.", value); // Noncompliant; String contains no format specifiers. (quote are discarding format specifiers) <br /> MessageFormat.format("Result {0}.", value, value);  // Noncompliant; 2nd argument is not used <br /> MessageFormat.format("Result {0}.", myObject.toString()); // Noncompliant; no need to call toString() on objects <br />  <br /> java.util.Logger logger; <br /> logger.log(java.util.logging.Level.SEVERE, "Result {0}.", myObject.toString()); // Noncompliant; no need to call toString() on objects <br /> logger.log(java.util.logging.Level.SEVERE, "Result.", new Exception()); // compliant, parameter is an exception <br /> logger.log(java.util.logging.Level.SEVERE, "Result '{0}'", 14); // Noncompliant - String contains no format specifiers. <br /> logger.log(java.util.logging.Level.SEVERE, "Result " + param, exception); // Noncompliant; Lambda should be used to differ string concatenation. <br />  <br /> org.slf4j.Logger slf4jLog; <br /> org.slf4j.Marker marker; <br />  <br /> slf4jLog.debug(marker, "message {}"); <br /> slf4jLog.debug(marker, "message", 1); // Noncompliant - String contains no format specifiers. <br />  <br /> org.apache.logging.log4j.Logger log4jLog; <br /> log4jLog.debug("message", 1); // Noncompliant - String contains no format specifiers. <br />  <br /> Compliant Solution <br />  <br /> String.format("First %s and then %s", "foo", "bar"); <br /> String.format("Display %2$d and then %d", 1, 3); <br /> String.format("Too many arguments %d %d", 1, 2); <br /> String.format("First Line%n"); <br /> String.format("Is myObject null ? %b", myObject == null); <br /> String.format("value is %d", value); <br /> String s = "string without arguments"; <br />  <br /> MessageFormat.format("Result {0}.", value); <br /> MessageFormat.format("Result '{0}'  =  {0}", value); <br /> MessageFormat.format("Result {0}.", myObject); <br />  <br /> java.util.Logger logger; <br /> logger.log(java.util.logging.Level.SEVERE, "Result {0}.", myObject); <br /> logger.log(java.util.logging.Level.SEVERE, "Result {0}'", 14); <br /> logger.log(java.util.logging.Level.SEVERE, exception, () -&gt; "Result " + param); <br />  <br /> org.slf4j.Logger slf4jLog; <br /> org.slf4j.Marker marker; <br />  <br /> slf4jLog.debug(marker, "message {}"); <br /> slf4jLog.debug(marker, "message {}", 1); <br />  <br /> org.apache.logging.log4j.Logger log4jLog; <br /> log4jLog.debug("message {}", 1); <br />  <br /> See <br />  <br />    CERT, FIO47-C. - Use valid format strings  <br /> |CODE_SMELL|MAJOR|1


## Security Hotspots

### Security hotspots count by category and priority

Category / Priority|LOW|MEDIUM|HIGH
---|---|---|---
LDAP Injection|0|0|0
Object Injection|0|0|0
Server-Side Request Forgery (SSRF)|0|0|0
XML External Entity (XXE)|0|0|0
Insecure Configuration|0|0|0
XPath Injection|0|0|0
Authentication|0|0|0
Weak Cryptography|0|0|0
Denial of Service (DoS)|0|0|0
Log Injection|0|0|0
Cross-Site Request Forgery (CSRF)|0|0|0
Open Redirect|0|0|0
Permission|0|0|0
SQL Injection|0|0|0
Encryption of Sensitive Data|0|0|0
Traceability|0|0|0
Buffer Overflow|0|0|0
File Manipulation|0|0|0
Code Injection (RCE)|0|0|0
Cross-Site Scripting (XSS)|0|0|0
Command Injection|0|0|0
Path Traversal Injection|0|0|0
HTTP Response Splitting|0|0|0
Others|0|0|0


### Security hotspots

