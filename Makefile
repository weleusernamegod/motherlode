# If you move this project you can change the directory 
# to match your GBDK root directory (ex: GBDK_HOME = "C:/GBDK/"
ifndef GBDK_HOME
GBDK_HOME = /usr/local/opt/gbdk/
endif

LCC = $(GBDK_HOME)bin/lcc
PNG2ASSET = $(GBDK_HOME)bin/png2asset

LCCFLAGS += -debug -Wl-yt0x1B -Wm-yo8 -Wm-ya4 -Wb-ext=.rel -Wm-yc -Wl-lhammer/hUGEDriver.lib
CFLAGS += -I$(ASSETDIR)

# You can set the name of the .gbc ROM file here
PROJECTNAME    = Motherlode

SRCDIR      = src
SFXDIR      = sfx
OBJDIR      = obj
ASSETDIR    = assets
BINDIR      = build
MKDIRS      = $(OBJDIR) $(BINDIR)

BINS	    = $(BINDIR)/$(PROJECTNAME).gbc
SRCSOURCES    = $(wildcard $(SRCDIR)/*.c)
SFXSOURCES    = $(wildcard $(SFXDIR)/*.c)
ASSETSOURCES = $(wildcard $(ASSETDIR)/*.c)
OBJS        = $(SRCSOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o) $(SFXSOURCES:$(SFXDIR)/%.c=$(OBJDIR)/%.o) $(ASSETSOURCES:$(ASSETDIR)/%.c=$(OBJDIR)/%.o)

.PHONY: all prepare hammer png2asset copy-rom clean

all: $(BINS) copy-rom clean

# Generate asset files
png2asset:
	$(PNG2ASSET) png/highlight_frame.png -c assets/highlight_frame.c -spr8x8 -sh 24 -keep_duplicate_tiles -noflip -px -8 -py -16 -tile_origin 0
	$(PNG2ASSET) png/loading_screen.png -c assets/loading_screen.c -spr8x8 -map -repair_indexed_pal -keep_palette_order -use_map_attributes -tile_origin 128 -noflip -b 1
	$(PNG2ASSET) png/rover.png -c assets/rover.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -tile_origin 1 -b 1
	$(PNG2ASSET) png/rover_eye.png -c assets/rover_eye.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -tile_origin 0 -px 8 -py 8 -b 1
	$(PNG2ASSET) png/tracks.png -c assets/tracks.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -sh 8 -tile_origin 5 -b 1
	$(PNG2ASSET) png/drill_h.png -c assets/drill_h.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -sh 16 -tile_origin 11 -b 1
	$(PNG2ASSET) png/drill_v.png -c assets/drill_v.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -sh 8 -tile_origin 15 -b 1
	$(PNG2ASSET) png/prop.png -c assets/prop.c -spr8x8 -no_palettes -noflip -sh 8 -tile_origin 19 -b 1
	$(PNG2ASSET) png/ore_tiles.png -c assets/ore_tiles.c -spr8x8 -tiles_only -keep_palette_order -max_palettes 24 -noflip -tile_origin 0 -b 1
	$(PNG2ASSET) png/progressbar.png -c assets/progressbar.c -spr8x8 -tiles_only -no_palettes -keep_duplicate_tiles -noflip -b 1

	$(PNG2ASSET) png/font.png -c assets/font.c -spr8x8 -repair_indexed_pal -noflip -keep_duplicate_tiles -tile_origin 194
	$(PNG2ASSET) png/character.png -c assets/character.c -spr8x8 -map -repair_indexed_pal -noflip -tile_origin 174
	$(PNG2ASSET) png/nav.png -c assets/nav.c -source_tileset png/character.png -spr8x8 -repair_indexed_pal -map -tile_origin 174 -noflip -b 1

	$(PNG2ASSET) png/station_sheet.png -c assets/station.c -spr8x8 -tiles_only -noflip -repair_indexed_pal -tile_origin 64
	$(PNG2ASSET) png/station_save.png -c assets/station_save.c -source_tileset png/station_sheet.png -spr8x8 -map -repair_indexed_pal -use_map_attributes -tile_origin 64 -noflip -b 1
	$(PNG2ASSET) png/station_powerup.png -c assets/station_powerup.c -source_tileset png/station_sheet.png -spr8x8 -map -repair_indexed_pal -use_map_attributes -tile_origin 64 -noflip -b 1
	$(PNG2ASSET) png/station_sell.png -c assets/station_sell.c -source_tileset png/station_sheet.png -spr8x8 -map -repair_indexed_pal -use_map_attributes -tile_origin 64 -noflip -b 1
	$(PNG2ASSET) png/station_upgrade.png -c assets/station_upgrade.c -source_tileset png/station_sheet.png -spr8x8 -map -repair_indexed_pal -use_map_attributes -tile_origin 64 -noflip -b 1
	
	$(PNG2ASSET) png/warning_cargo.png -c assets/warning_cargo.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles -tile_origin 48 -b 1
	$(PNG2ASSET) png/warning_fuel.png -c assets/warning_fuel.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles -tile_origin 55 -b 1
	$(PNG2ASSET) png/game_over_skull.png -c assets/game_over_skull.c -spr8x8 -no_palettes -noflip -keep_palette_order -sh 48 -tile_origin 64 -b 1
	$(PNG2ASSET) png/a_button.png -c assets/a_button.c -spr8x8 -no_palettes -noflip -sh 16 -tile_origin 96 -b 1
	$(PNG2ASSET) png/upgrade_tiles.png -c assets/upgrade_tiles.c -spr8x8 -noflip -keep_palette_order -max_palettes 36 -keep_duplicate_tiles -tile_origin 0 -b 2
	$(PNG2ASSET) png/upgrade_tick.png -c assets/upgrade_tick.c -spr8x8 -noflip -keep_palette_order -tile_origin 32 -b 2
	$(PNG2ASSET) png/upgrade_frame.png -c assets/upgrade_frame.c -spr8x8 -map -noflip -tile_origin 170 -b 2
	$(PNG2ASSET) png/sell_frame.png -c assets/sell_frame.c -spr8x8 -map -noflip -tile_origin 0 -b 3
	$(PNG2ASSET) png/powerup_frame.png -c assets/powerup_frame.c -spr8x8 -map -repair_indexed_pal -keep_palette_order -use_map_attributes -tile_origin 0 -noflip -b 3
	$(PNG2ASSET) png/fuel_display.png -c assets/fuel_display.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -py 0 -tile_origin 32 -b 3
	$(PNG2ASSET) png/splashscreen_screen.png -c assets/splashscreen_screen.c -spr8x8 -repair_indexed_pal -keep_duplicate_tiles -noflip -b 4
	$(PNG2ASSET) png/splashscreen.png -c assets/splashscreen.c -spr8x8 -map -use_map_attributes -b 4

# Compile .c files in "assets/" to .o object files
$(OBJDIR)/%.o: $(ASSETDIR)/%.c
	$(LCC) $(LCCFLAGS) $(CFLAGS) -c -o $@ $<

# Compile .c files in "sfx/" to .o object files
$(OBJDIR)/%.o: $(SFXDIR)/%.c
	$(LCC) $(LCCFLAGS) $(CFLAGS) -c -o $@ $<

# Compile .c files in "src/" to .o object files with specific flags for bank files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(eval EXTRA_FLAGS :=)
	$(if $(findstring level,$<), $(eval EXTRA_FLAGS := -Wf-ba0))
	$(LCC) $(LCCFLAGS) $(CFLAGS) $(EXTRA_FLAGS) -c -o $@ $<

# Link the compiled object files into a .gbc ROM file
$(BINS): $(OBJS)
	$(LCC) $(LCCFLAGS) $(CFLAGS) -o $(BINS) $(OBJS)

prepare:
	rm -rf $(OBJDIR) $(SFXDIR) $(ASSETDIR)
	mkdir -p $(OBJDIR)
	mkdir -p $(SFXDIR)
	mkdir -p $(ASSETDIR)
	mkdir -p $(BINDIR)

copy-rom:
	cp $(BINS) .

clean:
	rm -rf $(OBJDIR)

hammer:
	@cd hammer && python3 hammer2cbt.py --fxammo 10 --fxnamelist FXNAMELIST.txt hammered.sav 0 ../sfx/

# create necessary directories after Makefile is parsed but before build
# info prevents the command from being pasted into the makefile
$(info $(shell mkdir -p $(MKDIRS)))