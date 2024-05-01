#
# A Makefile that compiles all .c and .s files in "src" and "res" 
# subdirectories and places the output in a "obj" subdirectory
#

# If you move this project you can change the directory 
# to match your GBDK root directory (ex: GBDK_HOME = "C:/GBDK/"
ifndef GBDK_HOME
	GBDK_HOME = /usr/local/opt/gbdk/
endif

LCC = $(GBDK_HOME)bin/lcc 

LCCFLAGS += -debug -Wl-yt0x1B -Wm-yo4 -Wm-ya4 -Wb-ext=.rel -Wm-yc


# You can set the name of the .gbc ROM file here
PROJECTNAME    = Motherlode

SRCDIR      = src
OBJDIR      = obj
ASSETDIR    = assets
BINDIR      = build
MKDIRS      = $(OBJDIR) $(BINDIR)

BINS	    = $(OBJDIR)/$(PROJECTNAME).gbc
CSOURCES    = $(foreach dir,$(SRCDIR),$(notdir $(wildcard $(dir)/*.c))) $(foreach dir,$(ASSETDIR),$(notdir $(wildcard $(dir)/*.c)))
ASMSOURCES  = $(foreach dir,$(SRCDIR),$(notdir $(wildcard $(dir)/*.s)))
OBJS       = $(CSOURCES:%.c=$(OBJDIR)/%.o)

.PHONY: png2asset
png2asset:
	/usr/local/opt/gbdk/bin/png2asset png/font.png -c assets/font.c -spr8x8 -tiles_only -no_palettes -noflip

	/usr/local/opt/gbdk/bin/png2asset png/nav.png -c assets/nav.c -spr8x8 -map -tile_origin 96 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/rover.png -c assets/rover.c -spr8x8 -tiles_only -no_palettes -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/tile.png -c assets/tile.c -spr8x8 -tiles_only -no_palettes -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/progressbar.png -c assets/progressbar.c -spr8x8 -tiles_only -no_palettes -keep_duplicate_tiles -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/stationfuel.png -c assets/stationfuel.c -spr8x8 -tiles_only -noflip -keep_duplicate_tiles -b 1
	/usr/local/opt/gbdk/bin/png2asset png/stationsell.png -c assets/stationsell.c -spr8x8 -tiles_only -noflip -keep_duplicate_tiles -b 1
	/usr/local/opt/gbdk/bin/png2asset png/stationupgrade.png -c assets/stationupgrade.c -spr8x8 -tiles_only -noflip -keep_duplicate_tiles -b 1
	/usr/local/opt/gbdk/bin/png2asset png/stationrepair.png -c assets/stationrepair.c -spr8x8 -tiles_only -noflip -keep_duplicate_tiles -b 1

	/usr/local/opt/gbdk/bin/png2asset png/shoptiles.png -c assets/shoptiles.c -spr8x8 -tiles_only -noflip -keep_duplicate_tiles -b 2
	/usr/local/opt/gbdk/bin/png2asset png/shopframe.png -c assets/shopframe.c -spr8x8 -map -noflip -tile_origin 151 -b 2
	/usr/local/opt/gbdk/bin/png2asset png/buttonframe.png -c assets/buttonframe.c -spr8x8 -keep_duplicate_tiles -no_palettes -noflip -tiles_only -b 2

	/usr/local/opt/gbdk/bin/png2asset png/menubuttons.png -c assets/menubuttons.c -spr8x8 -keep_duplicate_tiles -no_palettes -noflip -b 3
	/usr/local/opt/gbdk/bin/png2asset png/splashscreen.png -c assets/splashscreen.c -spr8x8 -map -use_map_attributes -b 3

all:	clean prepare png2asset $(BINS) copy-rom

# Compile .c files in "src/" to .o object files with specific flags for bank files
$(OBJDIR)/%.o:	$(SRCDIR)/%.c
	$(eval EXTRA_FLAGS :=)
	$(if $(findstring level.ba0,$<), $(eval EXTRA_FLAGS := -Wf-ba0))
	$(if $(findstring level.ba1,$<), $(eval EXTRA_FLAGS := -Wf-ba1))
	$(LCC) $(LCCFLAGS) $(EXTRA_FLAGS) -c -o $@ $<

# Compile .c files in "res/" to .o object files
$(OBJDIR)/%.o:	$(ASSETDIR)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Link the compiled object files into a .gb ROM file
$(BINS):	$(OBJS)
	$(LCC) $(LCCFLAGS) -o $(BINDIR)/$(PROJECTNAME).gbc $(OBJS)

prepare:
	mkdir -p $(OBJDIR)

clean:
	rm -f  $(OBJDIR)/*.* $(BINDIR)/*.*

copy-rom:
	cp $(BINDIR)/$(PROJECTNAME).gbc .

# create necessary directories after Makefile is parsed but before build
# info prevents the command from being pasted into the makefile
$(info $(shell mkdir -p $(MKDIRS)))
