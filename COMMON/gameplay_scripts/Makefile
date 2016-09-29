#CC=perl
#BIN=./../bin/removeComments.pl
CP=cp
BIN2=./../bin/luaBeautifier
OBJDIR=./../assets/scripts/
SRCDIR=./scripts/

STRUCTURE := $(shell find $(SRCDIR) -type d)
CODEFILES := $(addsuffix /*, $(STRUCTURE))
CODEFILES := $(wildcard $(CODEFILES))

SRCFILES := $(filter %.lua, $(CODEFILES))
OBJFILES := $(subst $(SRCDIR), $(OBJDIR), $(SRCFILES:%.lua=%.lua))

export: $(OBJFILES)


$(OBJDIR)/%.lua: $(addprefix $(SRCDIR)/, %.lua)
	$(CP) $^ $@

compile:
	luac $(SRCFILES)

#$(OBJDIR)/%.lua: $(addprefix $(SRCDIR)/, %.lua)
	#$(CC) $(BIN) < $^ > $@

clean:
	-rm -r $(OBJFILES)



