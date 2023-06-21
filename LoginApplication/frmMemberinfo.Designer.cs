namespace LoginApplication
{
    partial class frmMemberinfo
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txt_Password = new System.Windows.Forms.TextBox();
            this.txt_UserName = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_Nickname = new System.Windows.Forms.TextBox();
            this.btn_Edit = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.btn_delete = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.btn_disable = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.GetLoginBy = new System.Windows.Forms.Button();
            this.GetActiveUsersRoleInfoLast1Hour = new System.Windows.Forms.Button();
            this.GetHighlyActiveUsersWithRoleInfo = new System.Windows.Forms.Button();
            this.GetUsersWithoutActivity = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // txt_Password
            // 
            this.txt_Password.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_Password.Location = new System.Drawing.Point(164, 89);
            this.txt_Password.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txt_Password.Name = "txt_Password";
            this.txt_Password.Size = new System.Drawing.Size(220, 26);
            this.txt_Password.TabIndex = 7;
            this.txt_Password.UseSystemPasswordChar = true;
            // 
            // txt_UserName
            // 
            this.txt_UserName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_UserName.Location = new System.Drawing.Point(164, 46);
            this.txt_UserName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txt_UserName.Name = "txt_UserName";
            this.txt_UserName.Size = new System.Drawing.Size(220, 26);
            this.txt_UserName.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(64, 92);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(78, 20);
            this.label2.TabIndex = 5;
            this.label2.Text = "Password";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(116, 49);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 20);
            this.label1.TabIndex = 4;
            this.label1.Text = "ID";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(27, 124);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(79, 20);
            this.label3.TabIndex = 4;
            this.label3.Text = "Nickname";
            // 
            // txt_Nickname
            // 
            this.txt_Nickname.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_Nickname.Location = new System.Drawing.Point(128, 121);
            this.txt_Nickname.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txt_Nickname.Name = "txt_Nickname";
            this.txt_Nickname.Size = new System.Drawing.Size(220, 26);
            this.txt_Nickname.TabIndex = 6;
            // 
            // btn_Edit
            // 
            this.btn_Edit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Edit.Location = new System.Drawing.Point(128, 162);
            this.btn_Edit.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btn_Edit.Name = "btn_Edit";
            this.btn_Edit.Size = new System.Drawing.Size(98, 30);
            this.btn_Edit.TabIndex = 8;
            this.btn_Edit.Text = "Edit";
            this.btn_Edit.UseVisualStyleBackColor = true;
            this.btn_Edit.Click += new System.EventHandler(this.btn_Submit_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btn_Edit);
            this.groupBox1.Controls.Add(this.txt_Nickname);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Location = new System.Drawing.Point(36, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(387, 208);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "회원정보 수정";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.textBox3);
            this.groupBox2.Controls.Add(this.btn_delete);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.btn_disable);
            this.groupBox2.Location = new System.Drawing.Point(36, 238);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(387, 135);
            this.groupBox2.TabIndex = 11;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "회원탈퇴";
            // 
            // textBox3
            // 
            this.textBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox3.Location = new System.Drawing.Point(128, 36);
            this.textBox3.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(220, 26);
            this.textBox3.TabIndex = 7;
            this.textBox3.UseSystemPasswordChar = true;
            // 
            // btn_delete
            // 
            this.btn_delete.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_delete.Location = new System.Drawing.Point(250, 81);
            this.btn_delete.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btn_delete.Name = "btn_delete";
            this.btn_delete.Size = new System.Drawing.Size(98, 30);
            this.btn_delete.TabIndex = 8;
            this.btn_delete.Text = "회원탈회";
            this.btn_delete.UseVisualStyleBackColor = true;
            this.btn_delete.Click += new System.EventHandler(this.button2_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(28, 39);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(78, 20);
            this.label6.TabIndex = 5;
            this.label6.Text = "Password";
            // 
            // btn_disable
            // 
            this.btn_disable.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_disable.Location = new System.Drawing.Point(128, 81);
            this.btn_disable.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.btn_disable.Name = "btn_disable";
            this.btn_disable.Size = new System.Drawing.Size(98, 30);
            this.btn_disable.TabIndex = 8;
            this.btn_disable.Text = "회원탈퇴";
            this.btn_disable.UseVisualStyleBackColor = true;
            this.btn_disable.Click += new System.EventHandler(this.button1_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.comboBox1);
            this.groupBox3.Controls.Add(this.GetLoginBy);
            this.groupBox3.Controls.Add(this.GetActiveUsersRoleInfoLast1Hour);
            this.groupBox3.Controls.Add(this.GetHighlyActiveUsersWithRoleInfo);
            this.groupBox3.Controls.Add(this.GetUsersWithoutActivity);
            this.groupBox3.Location = new System.Drawing.Point(36, 395);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(387, 135);
            this.groupBox3.TabIndex = 12;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "통계 조회";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.ItemHeight = 12;
            this.comboBox1.Items.AddRange(new object[] {
            "시간대별 로그인 회수 조회",
            "일별 로그인 회수 조회",
            "요일별 로그인 회수 조회",
            "월별 로그인 회수 조회"});
            this.comboBox1.Location = new System.Drawing.Point(32, 93);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(212, 20);
            this.comboBox1.TabIndex = 9;
            // 
            // GetLoginBy
            // 
            this.GetLoginBy.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GetLoginBy.Location = new System.Drawing.Point(267, 89);
            this.GetLoginBy.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.GetLoginBy.Name = "GetLoginBy";
            this.GetLoginBy.Size = new System.Drawing.Size(98, 30);
            this.GetLoginBy.TabIndex = 8;
            this.GetLoginBy.Text = "검색";
            this.GetLoginBy.UseVisualStyleBackColor = true;
            this.GetLoginBy.Click += new System.EventHandler(this.GetLoginBy_Click);
            // 
            // GetActiveUsersRoleInfoLast1Hour
            // 
            this.GetActiveUsersRoleInfoLast1Hour.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GetActiveUsersRoleInfoLast1Hour.Location = new System.Drawing.Point(250, 42);
            this.GetActiveUsersRoleInfoLast1Hour.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.GetActiveUsersRoleInfoLast1Hour.Name = "GetActiveUsersRoleInfoLast1Hour";
            this.GetActiveUsersRoleInfoLast1Hour.Size = new System.Drawing.Size(115, 30);
            this.GetActiveUsersRoleInfoLast1Hour.TabIndex = 8;
            this.GetActiveUsersRoleInfoLast1Hour.Text = "최근 1시간 활동";
            this.GetActiveUsersRoleInfoLast1Hour.UseVisualStyleBackColor = true;
            this.GetActiveUsersRoleInfoLast1Hour.Click += new System.EventHandler(this.GetActiveUsersRoleInfoLast1Hour_Click);
            // 
            // GetHighlyActiveUsersWithRoleInfo
            // 
            this.GetHighlyActiveUsersWithRoleInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GetHighlyActiveUsersWithRoleInfo.Location = new System.Drawing.Point(22, 42);
            this.GetHighlyActiveUsersWithRoleInfo.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.GetHighlyActiveUsersWithRoleInfo.Name = "GetHighlyActiveUsersWithRoleInfo";
            this.GetHighlyActiveUsersWithRoleInfo.Size = new System.Drawing.Size(126, 30);
            this.GetHighlyActiveUsersWithRoleInfo.TabIndex = 8;
            this.GetHighlyActiveUsersWithRoleInfo.Text = "활동 수 평균 이상";
            this.GetHighlyActiveUsersWithRoleInfo.UseVisualStyleBackColor = true;
            this.GetHighlyActiveUsersWithRoleInfo.Click += new System.EventHandler(this.GetHighlyActiveUsersWithRoleInfo_Click);
            // 
            // GetUsersWithoutActivity
            // 
            this.GetUsersWithoutActivity.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GetUsersWithoutActivity.Location = new System.Drawing.Point(165, 42);
            this.GetUsersWithoutActivity.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.GetUsersWithoutActivity.Name = "GetUsersWithoutActivity";
            this.GetUsersWithoutActivity.Size = new System.Drawing.Size(69, 30);
            this.GetUsersWithoutActivity.TabIndex = 8;
            this.GetUsersWithoutActivity.Text = "활동 X";
            this.GetUsersWithoutActivity.UseVisualStyleBackColor = true;
            this.GetUsersWithoutActivity.Click += new System.EventHandler(this.GetUsersWithoutActivity_Click);
            // 
            // frmMemberinfo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(458, 553);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.txt_Password);
            this.Controls.Add(this.txt_UserName);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox2);
            this.Name = "frmMemberinfo";
            this.Text = "Member info";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txt_Password;
        private System.Windows.Forms.TextBox txt_UserName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_Nickname;
        private System.Windows.Forms.Button btn_Edit;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btn_disable;
        private System.Windows.Forms.Button btn_delete;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button GetActiveUsersRoleInfoLast1Hour;
        private System.Windows.Forms.Button GetUsersWithoutActivity;
        private System.Windows.Forms.Button GetHighlyActiveUsersWithRoleInfo;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button GetLoginBy;
    }
}