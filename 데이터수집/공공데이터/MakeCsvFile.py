import pandas as pd

# JSON 데이터를 CSV 파일로 변환
def save_json_to_csv_file ( api_type, data_code, data_ymd, json_obj, json_obj_total_count ) :
    encoding  = get_encoding( api_type )
    file_name = get_file_name( api_type, data_ymd, 'csv' )

    if ( json_obj_total_count == 1 ) :
        # dict 또는 1 row 에러시 참조 URL : https://rfriend.tistory.com/482
        json_obj['dataCode'] = data_code
        json_df = pd.DataFrame(json_obj, index = [0])
    else :
        for obj in json_obj :
            obj['dataCode'] = data_code
        json_df = pd.DataFrame(json_obj)

    """
    header          = True (첫번째 줄을 칼럼 이름으로 사용)
    columns         = 특정 칼럼만 csv 로 쓰기 (내보내기) 할 때 칼럼 이름을 list에 적어줌
    index           = True (행의 이름 index 도 같이 내보냄. index 내보내기 싫으면 False 명기)
    float_format    = '%.2f' (예: float8 을 소수점 둘째 자리까지 표기)
    encoding        = 'utf-8' (on Python 3)
    line_terminator = '\n' (엔터로 줄 바꿈)
    date_format     = None (datetime 객체에 대한 format 설정하지 않음)
    출처: https://rfriend.tistory.com/252 [R, Python 분석과 프로그래밍의 친구 (by R Friend)]
    """
    json_df.to_csv(file_name + '.csv', mode = 'a', header = False, index = True, encoding = encoding)


# JSON 데이터를 log 파일로 변환
def save_json_to_log_file ( api_type, data_code, data_ymd, json_obj, json_obj_total_count ) :
    encoding  = get_encoding( api_type )
    file_name = get_file_name( api_type, data_ymd, 'txt' )

    file = open(file_name + '.txt', 'a')
    file.write(str(json_obj))
    file.write('\n')

    file.close()



# 파일 인코딩 타입 정의
def get_encoding ( api_type ) :
    """
    api_type 
    10 == 아파트매매 실거래 상세 자료
    11 == 아파트(도로명) 목록
    12 == 아파트(법정동) 목록
    13 == 아파트 기본정보
    """
    if ( api_type == '10' ) :
        return 'ms949'
    elif ( api_type == '11' ) :
        #return 'utf-8'
        return 'ms949'
    elif ( api_type == '12' ) :
        return 'ms949'
    elif ( api_type == '13' ) :
        return 'ms949'

# 파일 명칭 정의
def get_file_name ( api_type, data_ymd, pre_file_nm ) :
    """
    api_type 
    10 == 아파트매매 실거래 상세 자료
    11 == 아파트(도로명) 목록
    12 == 아파트(법정동) 목록
    13 == 아파트 기본정보
    """
    if ( api_type == '10' ) :
        return pre_file_nm + '_' + 'apt_trade_' + data_ymd
    elif ( api_type == '11' ) :
        return pre_file_nm + '_' + 'apt_list_road'
    elif ( api_type == '12' ) :
        return pre_file_nm + '_' + 'apt_list_bjd'
    elif ( api_type == '13' ) :
        return pre_file_nm + '_' + 'apt_info'
