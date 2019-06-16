/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/az_cad/Main-project/CG.vhd";



static void work_a_3888446748_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(16, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 < 500);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 4398);
    t13 = (t0 + 2912);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 10U);
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 2832);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4388);
    t6 = (t0 + 2912);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 10U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_3888446748_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3888446748_3212880686_p_0};
	xsi_register_didat("work_a_3888446748_3212880686", "isim/myTestBench_isim_beh.exe.sim/work/a_3888446748_3212880686.didat");
	xsi_register_executes(pe);
}
