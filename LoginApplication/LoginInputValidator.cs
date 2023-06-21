using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using System.Text.RegularExpressions;

namespace LoginApplication
{
    public static class LoginInputValidator
    {
        public static bool ValidateSignUpInput(string enteredId, string enteredPassword, string enteredNickname)
        {
            // 아이디, 비밀번호, 닉네임이 입력되지 않은 경우 경고 메시지 출력 후 종료
            if (string.IsNullOrEmpty(enteredId) || string.IsNullOrEmpty(enteredPassword) || string.IsNullOrEmpty(enteredNickname))
            {
                MessageBox.Show("아이디, 비밀번호, 닉네임을 입력해주세요");
                return false;
            }

            // 아이디 유효성 검사: 영숫자, "@", "."만 포함하고 영문자로 시작해야 함
            Regex idRegex = new Regex(@"^[a-zA-Z][a-zA-Z0-9@.]*$");
            if (!idRegex.IsMatch(enteredId))
            {
                MessageBox.Show("잘못된 사용자 이름 형식입니다. 사용자 이름은 영문자로 시작하고 영숫자, '@', '.'만 포함해야 합니다.", "잘못된 사용자 이름", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            // 아이디 길이 검사
            if (enteredId.Length > 32)
            {
                MessageBox.Show("아이디의 길이가 너무 깁니다. 최대 32자까지 입력할 수 있습니다.", "아이디 길이 초과", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            // 비밀번호 길이 검사
            if (enteredPassword.Length > 64)
            {
                MessageBox.Show("비밀번호의 길이가 너무 깁니다. 최대 64자까지 입력할 수 있습니다.", "비밀번호 길이 초과", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            // 닉네임 길이 검사
            if (enteredNickname.Length > 32)
            {
                MessageBox.Show("닉네임의 길이가 너무 깁니다. 최대 32자까지 입력할 수 있습니다.", "닉네임 길이 초과", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            // 비밀번호 ASCII 값 검사
            foreach (char c in enteredPassword)
            {
                if (c < 0x21 || c > 0x7E)
                {
                    MessageBox.Show("비밀번호에는 ASCII 값이 0x21 ~ 0x7E 사이인 문자만 사용할 수 있습니다.", "비밀번호 오류", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }

            return true;
        }

        public static bool ValidateLoginInput(string enteredId, string enteredPassword)
        {
            // 아이디, 비밀번호가 입력되지 않은 경우 경고 메시지 출력 후 종료
            if (string.IsNullOrEmpty(enteredId) || string.IsNullOrEmpty(enteredPassword))
            {
                MessageBox.Show("아이디, 비밀번호를 입력해주세요");
                return false;
            }

            // 아이디 유효성 검사: 영숫자, "@", "."만 포함하고 영문자로 시작해야 함
            Regex idRegex = new Regex(@"^[a-zA-Z][a-zA-Z0-9@.]*$");
            if (!idRegex.IsMatch(enteredId))
            {
                MessageBox.Show("잘못된 사용자 이름 형식입니다. 사용자 이름은 영문자로 시작하고 영숫자, '@', '.'만 포함해야 합니다.", "잘못된 사용자 이름", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            // 아이디 길이 검사
            if (enteredId.Length > 32)
            {
                MessageBox.Show("아이디의 길이가 너무 깁니다. 최대 32자까지 입력할 수 있습니다.", "아이디 길이 초과", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            // 비밀번호 길이 검사
            if (enteredPassword.Length > 64)
            {
                MessageBox.Show("비밀번호의 길이가 너무 깁니다. 최대 64자까지 입력할 수 있습니다.", "비밀번호 길이 초과", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            // 비밀번호 ASCII 값 검사
            foreach (char c in enteredPassword)
            {
                if (c < 0x21 || c > 0x7E)
                {
                    MessageBox.Show("비밀번호에는 ASCII 값이 0x21 ~ 0x7E 사이인 문자만 사용할 수 있습니다.", "비밀번호 오류", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }

            return true;
        }

        // 추가적인 로그인 유효성 검사 로직 작성...
    }
}
