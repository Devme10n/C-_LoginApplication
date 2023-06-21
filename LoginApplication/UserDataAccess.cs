using System.Data.SqlClient;

namespace LoginApplication
{
    public static class UserDataAccess
    {
        public static string GetUserId(string loginId)
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
                    using (SqlCommand cmd = new SqlCommand("pc_tUser_sel", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@login_id", loginId);

                        // 결과 값을 저장할 매개변수 정의
                        var userIdParam = cmd.Parameters.Add("@user_id", System.Data.SqlDbType.VarChar, 32);
                        userIdParam.Direction = System.Data.ParameterDirection.Output;

                        // 저장 프로시저 실행
                        cmd.ExecuteNonQuery();

                        // 결과 값을 변수에 할당
                        string userId = (string)userIdParam.Value;

                        return userId;
                    }
                }
            }
            catch
            {
                return string.Empty;
            }
        }
    }
}
