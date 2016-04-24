#       $OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $

PROG=	bsd-netcat
SRCS=	netcat.c atomicio.c socks.c base64.c

LIBS=  `pkg-config --libs libbsd` -lresolv
OBJS=  $(SRCS:.c=.o)
CFLAGS=  -g -O2
LDFLAGS=  -Wl,--no-add-needed

all: nc
nc: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $(PROG)

$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) nc
