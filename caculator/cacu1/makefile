Object=calc1
CC=gcc
LEX=flex
YACC=bison
RM=rm

$(Object): yy.tab.o  lex.yy.o
	$(CC) -o $@ $(LDFLAGS) $^ -ly -lfl
yy.tab.o: y.tab.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $^
lex.yy.o: lex.yy.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $^

y.tab.c:
	$(YACC) -d -y  $(Object).y	
lex.yy.c:
	$(LEX) $(Object).l

clean:
	$(RM) *.o *.c  $(Object)

.PHONY: clean
