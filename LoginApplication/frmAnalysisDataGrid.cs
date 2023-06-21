using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace LoginApplication
{
    public partial class frmAnalysisDataGrid : Form
    {
        private string login_id;
        private string pc_name;

        public frmAnalysisDataGrid(string login_id, string pc_name)
        {
            InitializeComponent();
            this.login_id = login_id;
            this.pc_name = pc_name;

            // pc_GetLoginsByWeekday의 출력 결과를 한글 요일로 변경하는 이벤트 핸들러
            dataGridView1.CellFormatting += DataGridView1_CellFormatting;

            LoadData(pc_name);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // 새로운 회원 정보 폼 생성 및 표시
            frmMemberinfo memberForm = new frmMemberinfo(login_id);
            memberForm.Show();

            // 현재 폼 숨김
            this.Hide();
        }

        private void LoadData(string storedProcedureName)
        {
            // SqlConnection 생성
            string connectionString = "Data Source=(local);Initial Catalog=Login_System;Integrated Security=SSPI";
            SqlConnection connection = new SqlConnection(connectionString);

            // SqlCommand 설정
            SqlCommand command = new SqlCommand(storedProcedureName, connection);
            command.CommandType = CommandType.StoredProcedure;

            // 데이터 가져오기
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            // 데이터를 DataTable에 저장
            DataTable dataTable = new DataTable();
            dataTable.Load(reader);

            // 한글 요일로 변경하는 이벤트 핸들러
            dataGridView1.CellFormatting += DataGridView1_CellFormatting;

            // DataGridView에 바인딩
            dataGridView1.DataSource = dataTable;

            // 리소스 정리
            reader.Close();
            connection.Close();
        }

        // pc_GetLoginsByWeekday의 출력 결과를 한글 요일로 변경
        private void DataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex].Name == "day_of_week")  // 'day_of_week'는 실제 day_of_week 컬럼의 이름이어야 합니다.
            {
                if (e.Value != null)
                {
                    switch (e.Value.ToString())
                    {
                        case "1":
                            e.Value = "일요일";
                            break;
                        case "2":
                            e.Value = "월요일";
                            break;
                        case "3":
                            e.Value = "화요일";
                            break;
                        case "4":
                            e.Value = "수요일";
                            break;
                        case "5":
                            e.Value = "목요일";
                            break;
                        case "6":
                            e.Value = "금요일";
                            break;
                        case "7":
                            e.Value = "토요일";
                            break;
                        default:
                            break;
                    }
                }
            }
        }

    }
}
