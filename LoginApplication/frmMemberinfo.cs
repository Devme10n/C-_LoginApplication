using System;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace LoginApplication
{
    public partial class frmMemberinfo : Form
    {
        private string login_id;

        public frmMemberinfo(string enteredId)
        {
            InitializeComponent();
            this.login_id = enteredId;
        }

        // 회원정보 수정 Click Event
        private void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                // 사용자가 입력한 아이디, 비밀번호, 닉네임 가져오기
                string enteredId = txt_UserName.Text;
                string enteredPassword = txt_Password.Text;
                string enteredNickname = txt_Nickname.Text;

                // 아이디와 비밀번호의 유효성 검사
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
                    using (SqlCommand cmd = new SqlCommand("pc_tLoginPass_upd", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@login_id", enteredId);
                        cmd.Parameters.AddWithValue("@nickname", enteredNickname);
                        cmd.Parameters.AddWithValue("@pass", enteredPassword);

                        // 저장 프로시저 실행
                        cmd.ExecuteNonQuery();

                        // 회원정보 수정 완료 메시지 출력
                        MessageBox.Show("회원정보가 수정되었습니다.", "회원정보 수정", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
            catch (Exception ex)
            {
                // 예외가 발생한 경우 예외 메시지를 출력
                MessageBox.Show("회원정보 수정에 실패하였습니다. " + ex.Message, "회원정보 수정 실패", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // 회원탈퇴 Click Event
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                // 데이터베이스 연결 문자열. 실제 데이터베이스 정보로 대체해야 합니다.
                string connectionString = "Data Source=(local);Initial Catalog=Login_System;Integrated Security=SSPI";

                // SqlConnection 객체를 사용하여 데이터베이스 연결
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // 연결을 열기
                    conn.Open();

                    // SqlCommand 객체 생성
                    using (SqlCommand cmd = new SqlCommand("pc_tLoginPass_del", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@login_id", login_id);

                        // 저장 프로시저 실행
                        cmd.ExecuteNonQuery();

                        // 회원탈퇴 완료 메시지 출력
                        MessageBox.Show("회원탈퇴가 완료되었습니다.", "회원탈퇴", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // 로그인 화면으로 돌아감
                        frmLogin loginForm = new frmLogin();
                        loginForm.Show();
                        this.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // 예외가 발생한 경우 예외 메시지를 출력
                MessageBox.Show("회원탈퇴에 실패하였습니다. " + ex.Message, "회원탈퇴 실패", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // 회원탈회 Click Event
        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                // 데이터베이스 연결 문자열. 실제 데이터베이스 정보로 대체해야 합니다.
                string connectionString = "Data Source=(local);Initial Catalog=Login_System;Integrated Security=SSPI";

                // SqlConnection 객체를 사용하여 데이터베이스 연결
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // 연결을 열기
                    conn.Open();

                    // SqlCommand 객체 생성
                    using (SqlCommand cmd = new SqlCommand("pc_tLoginPass_del", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@login_id", login_id);

                        // 저장 프로시저 실행
                        cmd.ExecuteNonQuery();
                    }

                    // 사용자 ID 가져오기
                    string userId = UserDataAccess.GetUserId(login_id);

                    // 회원탈회를 위한 저장 프로시저 실행
                    using (SqlCommand cmd = new SqlCommand("pc_tUser_del", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@user_id", userId);

                        // 저장 프로시저 실행
                        cmd.ExecuteNonQuery();

                        // 회원탈회 완료 메시지 출력
                        MessageBox.Show("회원탈회가 완료되었습니다.", "회원탈회", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // 로그인 화면으로 돌아감
                        frmLogin loginForm = new frmLogin();
                        loginForm.Show();
                        this.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // 예외가 발생한 경우 예외 메시지를 출력
                MessageBox.Show("회원탈회에 실패하였습니다. " + ex.Message, "회원탈회 실패", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        // 활동 수가 평균 이상인 사용자들의 닉네임과 역할 정보를 가져옴
        private void GetHighlyActiveUsersWithRoleInfo_Click(object sender, EventArgs e)
        {
            // 새로운 분석데이터 폼 생성 및 표시
            frmAnalysisDataGrid analysisDataGrid = new frmAnalysisDataGrid(login_id, "pc_GetHighlyActiveUsersWithRoleInfo");
            analysisDataGrid.Show();

            // 현재 폼 숨김
            this.Hide();
        }
        // 최근 1시간 동안 활동한 사용자들의 로그인 아이디와 역할 유형을 가져옴
        private void GetUsersWithoutActivity_Click(object sender, EventArgs e)
        {
            // 새로운 분석데이터 폼 생성 및 표시
            frmAnalysisDataGrid analysisDataGrid = new frmAnalysisDataGrid(login_id, "pc_GetUsersWithoutActivity");
            analysisDataGrid.Show();

            // 현재 폼 숨김
            this.Hide();
        }
        // 활동이 없는 사용자의 정보를 가져옴
        private void GetActiveUsersRoleInfoLast1Hour_Click(object sender, EventArgs e)
        {
            // 새로운 분석데이터 폼 생성 및 표시
            frmAnalysisDataGrid analysisDataGrid = new frmAnalysisDataGrid(login_id, "pc_GetActiveUsersRoleInfoLast1Hour");
            analysisDataGrid.Show();

            // 현재 폼 숨김
            this.Hide();
        }

        private void GetLoginBy_Click(object sender, EventArgs e)
        {
            // ComboBox에서 선택한 아이템 확인
            string selectedItem = comboBox1.SelectedItem.ToString();

            // 선택한 아이템에 따른 저장 프로시저 이름 설정
            // @별 로그인 통계
            string storedProcedureName;
            switch (selectedItem)
            {
                case "시간대별 로그인 회수 조회":
                    storedProcedureName = "pc_GetLoginByHour";
                    break;
                case "일별 로그인 회수 조회":
                    storedProcedureName = "pc_GetLoginByDay";
                    break;
                case "요일별 로그인 회수 조회":
                    storedProcedureName = "pc_GetLoginByDayOfWeek";
                    break;
                case "월별 로그인 회수 조회":
                    storedProcedureName = "pc_GetLoginByMonth";
                    break;
                default:
                    return; // 선택한 아이템이 없거나 예상치 못한 아이템인 경우 아무 동작도 하지 않음
            }

            // 새로운 분석데이터 폼 생성 및 표시
            frmAnalysisDataGrid analysisDataGrid = new frmAnalysisDataGrid(login_id, storedProcedureName);
            analysisDataGrid.Show();

            // 현재 폼 숨김
            this.Hide();
        }
    }
}
