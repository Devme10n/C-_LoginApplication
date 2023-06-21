using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace LoginApplication
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        // btn_Submit Click 이벤트 핸들러
        private void button1_Click(object sender, EventArgs e)
        {
            // 사용자가 입력한 아이디와 비밀번호 가져오기
            string enteredId = txt_UserName.Text;
            string enteredPassword = txt_Password.Text;

            // 입력한 아이디와 비밀번호 유효성 검사
            bool isValid = LoginInputValidator.ValidateLoginInput(enteredId, enteredPassword);
            if (!isValid)
            {
                return;
            }

            // 데이터베이스 연결 문자열. 실제 데이터베이스 정보로 대체해야 합니다.
            string connectionString = "Data Source=(local);Initial Catalog=Login_System;Integrated Security=SSPI";

            // SqlConnection 객체를 사용하여 데이터베이스 연결
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    // 연결을 열기
                    conn.Open();

                    // SqlCommand 객체 생성
                    using (SqlCommand cmd = new SqlCommand("pc_tLoginPass_checkLogin", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@login_id", enteredId);
                        cmd.Parameters.AddWithValue("@pass", enteredPassword);

                        // 결과 값을 저장할 매개변수 정의
                        var resultParam = cmd.Parameters.Add("@result", System.Data.SqlDbType.Int);
                        resultParam.Direction = System.Data.ParameterDirection.Output;

                        var nicknameParam = cmd.Parameters.Add("@nickname", System.Data.SqlDbType.VarChar, 32);
                        nicknameParam.Direction = System.Data.ParameterDirection.Output;

                        var user_idParam = cmd.Parameters.Add("@user_id", System.Data.SqlDbType.VarChar, 32);
                        user_idParam.Direction = System.Data.ParameterDirection.Output;

                        // 저장 프로시저 실행
                        cmd.ExecuteNonQuery();

                        // 결과 값을 변수에 할당
                        int result = (int)resultParam.Value;

                        // 로그인이 성공한 경우
                        if (result == 1)
                        {
                            // 닉네임과 사용자 ID를 가져옴
                            string nickname = (string)nicknameParam.Value;
                            string userId = (string)user_idParam.Value;

                            // 로그인 성공 메시지 출력
                            string successMessage = "Login Successful! Welcome " + nickname + "!";
                            MessageBox.Show(successMessage, "Login Successful", MessageBoxButtons.OK, MessageBoxIcon.Information);

                            // SqlCommand 객체 생성 - 사용자 활동 기록
                            using (SqlCommand activityCmd = new SqlCommand("pc_tUserActivity_ins", conn))
                            {
                                activityCmd.CommandType = System.Data.CommandType.StoredProcedure;
                                activityCmd.Parameters.AddWithValue("@login_id", enteredId);
                                activityCmd.Parameters.AddWithValue("@user_act_type", "login");

                                // 사용자 활동 아이디를 받을 매개변수 정의
                                var userActIdParam = activityCmd.Parameters.Add("@user_act_id", System.Data.SqlDbType.UniqueIdentifier);
                                userActIdParam.Direction = System.Data.ParameterDirection.Output;

                                // 저장 프로시저 실행
                                activityCmd.ExecuteNonQuery();

                                // 사용자 활동 아이디 값을 변수에 할당
                                Guid userActId = (Guid)userActIdParam.Value;
                            }

                            // 새로운 회원 정보 폼 생성 및 표시
                            frmMemberinfo memberForm = new frmMemberinfo(enteredId);
                            memberForm.Show();

                            // 현재 폼 숨김
                            this.Hide();
                        }
                        else
                        {
                            // 로그인 실패 메시지 출력
                            MessageBox.Show("Login Failed!");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // 예외가 발생한 경우 메시지 박스에 예외 메시지 출력
                    MessageBox.Show(ex.Message);
                }
            }
        }

        // button_Signup Click 이벤트 핸들러
        private void button_Signup_click(object sender, EventArgs e)
        {
            // 회원 가입 폼 생성 및 표시
            frmSignUp signUpForm = new frmSignUp();
            signUpForm.Show();

            // 현재 폼 숨김
            this.Hide();
        }
    }
}
