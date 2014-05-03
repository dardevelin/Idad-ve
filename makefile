BDIR=bin
SOURCES=src/MainWindow.vala
EXEC=idad-ve

all: $(SOURCES)
	mkdir -p $(BDIR)
	valac --pkg gtk+-3.0 $(SOURCES) -o $(BDIR)/$(EXEC)
