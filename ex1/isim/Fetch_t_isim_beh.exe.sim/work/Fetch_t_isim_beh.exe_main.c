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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003635436260_0818658551_init();
    work_m_00000000000407460910_4033376979_init();
    work_m_00000000000919673017_1785967555_init();
    work_m_00000000003968035491_0267516215_init();
    work_m_00000000003514685798_2456437516_init();
    work_m_00000000001752073075_1307194410_init();
    work_m_00000000001646000450_3003879648_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001646000450_3003879648");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
