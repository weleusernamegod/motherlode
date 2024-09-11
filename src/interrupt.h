#ifndef INTERRUPT_H
#define INTERRUPT_H

void test(void);
void interrupt_LCD(void);
void interrupt_VBL_window(void);
void interrupt_VBL_framecounter(void);
void init_VBL_interrupts(void);
void init_enable_lcd_interrupt(void);
void init_disable_lcd_interrupt(void);

#endif // INTERRUPT_H