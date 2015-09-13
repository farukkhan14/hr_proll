<ul id="nav" class="dropdown dropdown-linear dropdown-columnar">
    <li><?php echo CHtml::link('Dashboard', array('/site/dashboard')); ?></li>
    <li class="dir">Soft Configure
        <ul>
            <li class="dir"><span class="titleM">Additional</span>
                <ul>
                    <li><span class="menu_item_users"></span><?php echo CHtml::link('Manage Users', array('/users/admin')); ?></li>
                    <li><span class="menu_item_permissions"></span><?php echo CHtml::link('Manage Permissions', array('/rights')); ?></li>
                </ul>
            </li>    
        </ul>
    </li>
    <li class="dir">HR & PAYROLL
        <ul>
            <li class="dir"><span class="titleM">COMPANY SETUP</span>
                <ul>
                    <li><span class="menu_item_ci"></span><?php echo CHtml::link('Company Informations', array('/yourCompany/admin')); ?></li>
                    <li><span class="menu_item_br"></span><?php echo CHtml::link('Branches', array('/branches/admin')); ?></li>
                    <li><span class="menu_item_dp"></span><?php echo CHtml::link('Departments', array('/departments/admin')); ?></li>
                    <li><span class="menu_item_sc"></span><?php echo CHtml::link('Sections', array('/sections/admin')); ?></li>
                    <li><span class="menu_item_ssc"></span><?php echo CHtml::link('Sub-Sections', array('/sectionsSub/admin')); ?></li>
                    <li><span class="menu_item_tl"></span><?php echo CHtml::link('Teams / Lines', array('/teams/admin')); ?></li>
                    <li><span class="menu_item_ds"></span><?php echo CHtml::link('Designations', array('/designations/admin')); ?></li>
                    <li><span class="menu_item_sct"></span><?php echo CHtml::link('Stuff Categories', array('/stuffCat/admin')); ?></li>
                    <li><span class="menu_item_ssct"></span><?php echo CHtml::link('Stuff Sub-Categories', array('/stuffSubCat/admin')); ?></li>
                    <li><span class="menu_item_sh"></span><?php echo CHtml::link('Shift Heads', array('/shiftHeads/admin')); ?></li>
                    <li><span class="menu_item_aem"></span><?php echo CHtml::link('Add Employee', array('/employees/create')); ?></li>
                    <li><span class="menu_item_pa"></span><?php echo CHtml::link('Profile & Attachments', array('/employees/adminEmpDocs')); ?></li>
                    <li><span class="menu_item_me"></span><?php echo CHtml::link('Manage Employees', array('/employees/admin')); ?></li>
                    <li><span class="menu_item_er"></span><?php echo CHtml::link('Employee Resign', array('/empResign/admin')); ?></li>
                </ul>
            </li>    
            <li class="dir"><span class="titleM">EARN / DEDUCT, BONUS, LOAN</span>
                <ul>
                    <li><span class="menu_item_pg"></span><?php echo CHtml::link('Pay Grades', array('/payGrades/admin')); ?></li>
                    <li><span class="menu_item_edh"></span><?php echo CHtml::link('Earn-Deduct Heads', array('/ahProll/admin')); ?></li>
                    <li><span class="menu_item_edhc"></span><?php echo CHtml::link('Configure', array('/ahAmountProll/admin')); ?></li>
                    <li><span class="menu_item_otr"></span><?php echo CHtml::link('OT Rate', array('/otRate/admin')); ?></li>
                    <li><span class="menu_item_bh"></span><?php echo CHtml::link('Bonus Heads', array('/bonusTitles/admin')); ?></li>
                    <li><span class="menu_item_ab"></span><?php echo CHtml::link('Assign Bonus', array('/bonusAmounts/admin')); ?></li>
                    <li><span class="menu_item_apr"></span><?php echo CHtml::link('Advance Pay / Receive', array('/advancePayRecv/admin')); ?></li>
                </ul>
            </li>
            <li class="dir"><span class="titleM">LEAVE MANAGEMENT</span>
                <ul>
                    <li><span class="menu_item_lvh"></span><?php echo CHtml::link('Leave Heads', array('/lhProll/admin')); ?></li>
                    <li><span class="menu_item_lvhc"></span><?php echo CHtml::link('Configure', array('/lhAmountProll/admin')); ?></li>
                    <li><span class="menu_item_tlv"></span><?php echo CHtml::link('Take a Leave', array('/empLeaves/admin')); ?></li>
                </ul>
            </li> 
            <li class="dir"><span class="titleM">ATTENDANCE MANAGEMENT</span>
                <ul>
                    <li><span class="menu_item_wd"></span><?php echo CHtml::link('Working Day', array('/workingDay/admin')); ?></li>
                    <li><span class="menu_item_amn"></span><?php echo CHtml::link('Attendance (Manual)', array('/empAttendance/create')); ?></li>
                    <li><span class="menu_item_adv"></span><?php echo CHtml::link('Attendance (Device)', array('/empAttendance/uploadDeveiceData')); ?></li>
                    <li><span class="menu_item_mai"></span><?php echo CHtml::link('Manage Attn. Info', array('/empAttendance/admin')); ?></li>
                </ul>
            </li> 
            <li class="dir"><span class="titleM">REPORTS</span>
                <ul>
                    <li><span class="menu_item_report"></span><?php echo CHtml::link('Attedance (Summary)', array('/employees/attendanceReportSummary')); ?></li>
                    <li><span class="menu_item_report"></span><?php echo CHtml::link('Attedance (Emp. Wise)', array('/employees/attendanceReport')); ?></li>
                    <li><span class="menu_item_report"></span><?php echo CHtml::link('Salary Sheet', array('/employees/employeePaySlip')); ?></li>
                    <li><span class="menu_item_report"></span><?php echo CHtml::link('Payslip', array('/employees/paySlipSingle')); ?></li>
                </ul>
            </li> 
        </ul>
    </li>
    <li><?php echo CHtml::link('Logout ( ' . Yii::app()->user->name . ' )', array('/site/logout')); ?></li>
    <li class="softName">HR & PROLL SYSTEM</li>
 </ul>
