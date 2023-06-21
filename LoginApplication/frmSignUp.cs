using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.Text.RegularExpressions;

namespace LoginApplication
{
    public partial class frmSignUp : Form
    {
        public frmSignUp()
        {
            InitializeComponent();
        }

        // string to SHA-256
        public static string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                // 사용자가 입력한 아이디, 비밀번호, 닉네임 가져오기
                string enteredId = txt_UserName.Text;
                string enteredPassword = txt_Password.Text;
                string enteredNickname = txt_Nickname.Text;

                // 입력한 아이디, 비밀번호, 닉네임 유효성 검사
                bool isValid = LoginInputValidator.ValidateSignUpInput(enteredId, enteredPassword, enteredNickname);
                if (!isValid)
                {
                    return;
                }

                // 데이터베이스 연결 문자열. 실제 데이터베이스 정보로 대체해야 합니다.
                string connectionString = "Data Source=(local);Initial Catalog=Login_System;Integrated Security=SSPI";

                // SqlConnection 객체를 사용하여 데이터베이스 연결
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // 연결을 열기
                    conn.Open();

                    // SqlCommand 객체 생성
                    using (SqlCommand cmd = new SqlCommand("pc_tLoginPass_ins", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@login_id", enteredId);
                        cmd.Parameters.AddWithValue("@nickname", enteredNickname);
                        cmd.Parameters.AddWithValue("@pass", enteredPassword);

                        // 입력한 아이디를 SHA-256 해시 값으로 변환하여 사용자 아이디(userId)로 사용
                        string userId = ComputeSha256Hash(enteredId);
                        cmd.Parameters.AddWithValue("@user_id", userId);

                        // 저장 프로시저 실행
                        cmd.ExecuteNonQuery();
                    }

                    // pc_tUserRole_ins - 사용자 역할 부여(user)
                    using (SqlCommand cmdRole = new SqlCommand("pc_tUserRole_ins", conn))
                    {
                        cmdRole.CommandType = System.Data.CommandType.StoredProcedure;
                        cmdRole.Parameters.AddWithValue("@login_id", enteredId);
                        cmdRole.Parameters.AddWithValue("@user_role_type", "user");

                        // 사용자 역할 아이디를 받을 매개변수 정의
                        var userRoleIdParam = cmdRole.Parameters.Add("@user_role_id", System.Data.SqlDbType.UniqueIdentifier);
                        userRoleIdParam.Direction = System.Data.ParameterDirection.Output;

                        // 저장 프로시저 실행
                        cmdRole.ExecuteNonQuery();

                        // 사용자 역할 아이디 값을 변수에 할당
                        Guid userRoleId = (Guid)userRoleIdParam.Value;
                    }

                    /***
                    // SqlCommand 객체 생성 - 사용자 활동 기록
                    using (SqlCommand activityCmd = new SqlCommand("pc_tUserActivity_ins", conn))
                    {
                        activityCmd.CommandType = System.Data.CommandType.StoredProcedure;
                        activityCmd.Parameters.AddWithValue("@login_id", enteredId);
                        activityCmd.Parameters.AddWithValue("@user_act_type", "signup");

                        // 사용자 활동 아이디를 받을 매개변수 정의
                        var userActIdParam = activityCmd.Parameters.Add("@user_act_id", System.Data.SqlDbType.UniqueIdentifier);
                        userActIdParam.Direction = System.Data.ParameterDirection.Output;

                        // 저장 프로시저 실행
                        activityCmd.ExecuteNonQuery();

                        // 사용자 활동 아이디 값을 변수에 할당
                        Guid userActId = (Guid)userActIdParam.Value;
                    }
                    ***/

                    // 회원가입에 성공한 경우 환영 메시지를 팝업으로 보여줌
                    string welcomeMessage = enteredNickname + "님 환영합니다.";
                    MessageBox.Show(welcomeMessage, "회원가입 성공", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // 새로운 회원 정보 폼 생성 및 표시
                    frmMemberinfo memberForm = new frmMemberinfo(enteredId);
                    memberForm.Show();

                    // 현재 폼 숨김
                    this.Hide();
                }
            }
            catch (Exception ex)
            {
                // 예외가 발생한 경우 예외 메시지를 출력
                MessageBox.Show("회원가입에 실패하였습니다. " + ex.Message, "회원가입 실패", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
