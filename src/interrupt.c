#include <gb/gb.h>
#include <stdio.h>

#include "globals.h"
#include "constants.h"


void interrupt_LCD(void) {
    move_win(167, 0);
}
void interrupt_VBL_window(void) {
    move_win(7, 0);
}

void interrupt_VBL_framecounter(void) {
    frame_counter++;  // Increment the frame counter every VBlank
    if (frame_counter >= 60) frame_counter = 0;
}

void init_framecounter(void) {
    add_VBL(interrupt_VBL_framecounter);  // Add the VBL interrupt handler
    enable_interrupts();  // Enable interrupts globally
}

void init_enable_lcd_interrupt(void){
    // 01000000 -Hex->0x40 we have enabled bit 6 of LCD STATUS REGISTER, so LCD interrupt will be trigerred when LYC == LY
    STAT_REG = 0x40;
    // LCD interrupt will be triggered when PPU reaches 8 LCD line
    LYC_REG = 16;
    disable_interrupts();
    add_LCD(interrupt_LCD);
    add_VBL(interrupt_VBL_window);
    enable_interrupts();
    set_interrupts(VBL_IFLAG | LCD_IFLAG);
}

void init_disable_lcd_interrupt(void) {
    disable_interrupts();  // Temporarily disable all interrupts

    // Remove LCD and VBL interrupt handlers
    remove_LCD(interrupt_LCD);
    remove_VBL(interrupt_VBL_window);

    // Reset LCD status register to disable LCD interrupts
    STAT_REG = 0x00; // This sets the STAT_REG to a state where no LCD STAT interrupts are enabled
    enable_interrupts();  // Re-enable interrupts
    set_interrupts(VBL_IFLAG | LCD_IFLAG);
}