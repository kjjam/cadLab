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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_1242562249;
char *STD_STANDARD;
char *IEEE_P_2592010699;
char *UNISIM_P_0947159679;
char *IEEE_P_1367372525;
char *UNISIM_P_3222816464;
char *IEEE_P_2717149903;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    unisim_p_0947159679_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_1490675510_1976025627_init();
    unisim_a_0780662263_2014779070_init();
    unisim_a_4002211264_2683070183_init();
    unisim_a_1893280375_2982649196_init();
    unisim_a_2575347804_2982649196_init();
    unisim_a_0402065255_2679555531_init();
    unisim_a_0257220610_1233898481_init();
    work_a_0852845514_3212880686_init();
    work_a_4143040398_3212880686_init();
    work_a_0925478845_3212880686_init();
    work_a_3888446748_3212880686_init();
    work_a_1700238560_3212880686_init();
    work_a_2753280750_3212880686_init();
    work_a_1789943670_2372691052_init();


    xsi_register_tops("work_a_1789943670_2372691052");

    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
