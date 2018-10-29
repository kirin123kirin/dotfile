" Vim syntax file
" Language: dml base on C++
" Current Maintainer: vim-jp (https://github.com/vim-jp/vim-cpp)
if version < 600
syntax clear
elseif exists("b:current_syntax")
finish
endif
" Read the C syntax to start with
if version < 600
so <sfile>:p:h/c.vim
else
runtime! syntax/c.vim
unlet b:current_syntax
endif

syn keyword cppStatement new delete this friend using
syn keyword dmlStatement file_information  decode_datetime_as_local  string_lrtrim  decimal_round_even  force_error  is_blank  datetime_year  vector_sort  random_value  read_type  key_info  this_partition  allocate  file_link_target  db_get  decimal_round_down  start_at_direct_address  rabbitmq_bind_queue  get_hr_timer  math_exp  blas_gemm  math_max  math_min  re_match_replace  pdl_get_external_parameter_value   bv_highest_one_bit  encode_date  date_day_of_month  lookup_match_local  bv_vector_exclusive_or  string_representation  datetime_microsecond  from_xml  xml_parse  lookup_mention  number_of_partitions  vector_stdev  lookup_count  date_day  datetime_add  now  scanf_long  string_filter_out  decode_base64  read_portion  dset_mode_info   lookup_save_cursor  error_if_null  wavg  string_lrepad  db_describe  vector_bsearch_all  write_tcp    is_operational_day  copy_data  pdl_resolve_to_string   hex_dump_data  continuous_timer_tick  make_constant_vector  rabbitmq_unbind_queue  multistring_free  math_acos  db_rollback  string_split_quoted  bv_from_index_vector  scanf_double  rabbitmq_unbind_exchange  all_null  today  vector_concatenation  random_value_from_profile_extract  vector_merge  cobol_high_values  db_lookup  lookup_add  stop_at_direct_address  translate_characters  stdev  db_disconnect  string_ltrim  multistring_rfind  math_log10  db_free  math_isnan  math_pow  string_han_to_zen_hiragana  rabbitmq_purge_queue  xml_end_document  vector_difference  unique_identifier_pieces  ra_length  datetime_zone_offset  datetime_difference_seconds  lookup_make_template  bv_all_ones  this_host_name  vector_stable_sort  max  datetime_day  dset_info   vector_slice  date_day_of_year  lookup_range_open_count  string_replace  add_rules  first_without_error  accumulation  all_defined  decimal_truncate  sum  avg  new_xml_doc  vector_avg  bv_append_block  xml_end_element  lookup  hash_value  blas_nrm2  tcp_register_event  timezone_short_names  db_next_result  next_flow_state  string_join  directory_listing  decimal_round  sql_or  lookup_load  decode_datetime  re_get_matches  lookup_previous  wfirst  wsum multistring_create  lookup_range_open_match_local  ra_add_raw  floor  cobol_low_values  datetime_change_zone  compile_function  flatten_type  bv_zero_bit_above  encode_datetime  pdl_resolve   date_difference_days  read_transform  test_characters_all  string_length  xml_get_element  file_realpath  write_to_log_file  null_if_error  read_object  lookup_previous_local  lookup_restore_cursor  free_function  edit_distance  vector_union  make_field  db_get_datetime  string_split_no_empty  read_file  vld_lookup_by_key  is_valid  date_month_end  last  scanf_string  vector_sum  db_lookup_first  this_partition_path  vector_intersection  count  lookup_cache_size  sv_create_collection  invocation_number  math_atan2  string_char  bv_all_zeros  string_filter  concatenation  make_expression  db_lookup_check_and_reconnect http_register_event  multifile_information  multistring_find_all  db_list  vector_rank  xml_get_attribute  lookup_range_local  blas_ger  previous_operational_day    lookup_local  apply  encode_local_datetime  apply_function  decimal_lrepad  string_convert_explicit  make_package  decrypt_integer db_statement  this_component  sv_this_key project_type  sv_apply  join_types  lookup_last_local  encrypt_aes_simple  db_name  bv_difference  is_same_type  db_get_int  sleep_for_microseconds  string_rindex  rabbitmq_delete_exchange  datetime_difference  lookup_last  close_output  bv_pack  db_server_version  add_fields  xml_add_attribute  ra_free  datetime_hour  db_lookup_information  cobol_allocate  lookup_information_local  next_operational_day  cobol_is_alphabetic_lower  datetime_day_of_week  decrypt_string_strict fail_if_error  call_tcp_connect  re_split_no_empty  db_end  waccumulation  vector_min  lookup_not_loaded  datetime_difference_months  add_arg  last_error  decrypt_aes_simple  make_transform  db_lookup_next  write_record  reinterpret_as  is_null  tcp_client_shutdown  put_tagged_tracking_value  blas_copy  math_finite  bv_indices  dml_pretty_print  lookup_range_open  ddl_name_to_dml_name  datetime_minute  string_upcase  cobol_initialize  make_pset  get_hr_timer_rate  lookup_next  first  lookup_range_last  write_data  db_put  wlast  make_profile_extract  sv_apply_if_exists  is_failure  create_accumulator  lookup_nth  get_partitions  reinterpret  datetime_add_months  vector_sort_dedup_first  multistring_find  bv_and  tcp_server_connect  string_to_hex  lookup_maxkey  raw_data_substring  string_concat  lookup_range_open_local  vector_append  deflate  datetime_difference_abs  cobol_move  db_getsqlca  datetime_from_390_tod  lookup_next_local  db_bind  lookup_expunge  read_record  db_commit  date_year  date_difference_months  vld_lookup_by_obj_key  scanf_float  bv_or  random  hamming_distance  read_string  product  timezone_to_utc  set_compressed_byte_skip_count  get_flow_state  math_abs  make_arg  ra_create  add_key  bv_vector_and  db_get_tag  db_set_tag  rabbitmq_queue_exists  translate_nibbles  ra_size  make_byte_flags  re_replace  string_split  xml_begin_document  call_tcp_shutdown  string_is_alphabetic  math_tanh  db_client_version  tcp_client_disconnect  re_replace_first  datetime_difference_days  python_release_handle  call_tcp  lookup_expunge_local  datetime_to_unixtime  ra_contents  db_lookup_handle  vector_search  wdistinct_values  date_month  string_index  utc_now  string_trim  blas_gemv  add_locals  bv_not  bv_append  string_suffix  datetime_difference_minutes  now1  decode_date  db_lookup_connect  scanf_int  string_cleanse_shift_jis  decimal_strip  java_release_all_handles  rabbitmq_declare_queue  inflate  re_index  wmax  wmin  datetime_day_of_month  ends_with  add_local  add_statement  sql_and  vector_select  ra_contents_raw  rabbitmq_exchange_exists  db_config  unique_identifier  re_get_range_matches  make_statement  vector_search_all  sv_free  cobol_is_alphabetic  date_day_of_week  bv_count_one_bits  lookup_create  encode_base64  bv_one_bit_above  cobol_modify  vector_concat  file_link_information  make_type  url_encode_escapes  math_log  math_tan  peek_object  db_lookup_commit  accumulated_value  encrypt_integer call_abinitio_rpc  string_repad  blas_axpy  compare  rabbitmq_declare_exchange  ddl_to_dml  blas_iamax  reject_data  blas_dot  lookup_nth_local  datetime_second  url_decode_escapes  allocate_with_defaults  xml_format  wstdev  set_starting_byte_offset  vector_max  datetime_from_unixtime  find_variable_references  output_connected  rabbitmq_bind_exchange  compare_versions  lookup_range_open_count_local  make_local  hash_SHA256  read_package     encrypt_string_strict decimal_lpad  translate_bytes  lookup_information  math_asin  math_atan  datetime_day_of_year  index_of  lookup_range  add_rule  next_in_sequence  function_handle  advance_accumulator  cobol_move_corresponding  test_characters_any  local_now  blas_scal  make_scomment  hash_SHA1  db_lookup_not_loaded  dump_state  string_han_to_zen_katakana  add_statements  get_character_set  is_present  read_byte  allocate_with_nulls  encrypt_string bv_unpack  cobol_is_numeric  starts_with  db_lookup_disconnect  ceiling  xml_begin_element  to_xml  re_match_replace_all  cobol_is_alphabetic_upper  blas_asum  math_cos  make_key  math_sin  string_is_numeric  force_abort  permute  is_error  lookup_range_last_local  vector_sort_dedup_last  first_defined  last_error_reset  bv_vector_or  enable_direct_addresses  db_lookup_flush_cache  decode_delimited_bcd  string_truncate_explicit  math_sqrt  reinterpret_handle  bv_format  number_of_downstream_partitions  lookup_range_match_local  add_field  cobol_compare  unicode_char_string  canonical_representation  timezone_from_utc  size_of  wcount  bv_above_threshold  compatible_version  raw_data_concat  package_info     update_accumulator  decimal_round_up  previous  date_add_months  db_get_string  bv_element  configuration_value  decrypt_string today1  lookup_range_open_last_local  length_of  string_pad  string_substring  string_compare  add_function_field  min  lookup_range_open_last  string_cleanse_euc_jp  create_translation_vector_from_lookup  java_release_handle  write_to_log  lookup_count_local  multistring_lfind  lookup_reload  is_defined  make_rule  ra_add  unpack_nibbles  date_to_int  expression_info  pset_info  expand_type  string_lpad  hash_MD5  lookup_range_match  re_split  math_cosh  math_sinh  from_json  string_replace_first  is_bzero  lookup_first_local  re_get_match  eval  xml_add_element  string_prefix  lookup_unload  input_connected  string_cleanse  lookup_load_all_templates  string_downcase  string_like  wcount_distinct  xml_add_cdata  vector_product  decode_date_record  write_string  lookup_maxkey_local  in_micrograph  lookup_mention_local  printf  to_json  datetime_month  bv_exclusive_or  lookup_range_count_local  datetime_difference_hours  assert  hash_SHA512  lookup_first  lookup_match  lookup_range_count  lookup_range_open_match  string_from_hex  db_connect  vector_bsearch
syn keyword cppAccess public protected private
syn keyword cppType inline virtual explicit export bool wchar_t
syn keyword dmlType string __KEYTYPE__ ibm iso_greek packed ascii ieee iso_hebrew real iso_latin big include iso_latin_1 reinterpret_as char int iso_latin_2 shift_jis integer iso_latin_3 short date iso_8859_1 iso_latin_4 signed datetime iso_8859_2 iso_turkish string decimal iso_8859_3 jis_201 iso_8859_4  double iso_8859_5 little  ebcdic iso_8859_6 long unicode iso_8859_7 iso_8859_8 unsigned endian iso_8859_9 utf8 euc_jis iso_arabic NULL NULL_TYPE void float iso_cyrillic
syn keyword cppExceptions throw try catch
syn keyword dmlExceptions force_error
syn keyword cppOperator operator typeid
syn keyword dmlOperator for iso_easteuropean package and begin record if constant switch type member delimiter let this_record else union end metadata not or while
syn keyword cppOperator and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword dmlCast ::
syn keyword cppStorageClass mutable
syn keyword cppStructure class typename template namespace
syn keyword dmlStructure  bit_vector_index_t bit_vector_t canonical_representation_t coverage_v3 dataset_rec_t datetime_difference_type db_sqlca_t decode_date_type decode_datetime_type decode_datetime_tz_type directory_listing_type dml_arg dml_arg_vec dml_expression_info dml_field_info dml_field_info_item_vec dml_field_info_vec dml_include_vec dml_key_info dml_key_info_vec dml_key_t dml_metadata_string dml_metadata_string_vec dml_package_info dml_package_member dml_ptr_t dml_python_handle_t dml_range_t dml_rule dml_rule_vec dml_scomment_info dml_scomment_part dml_scomment_part_vec dml_size_t dml_statement dml_statement_info dml_statement_vec dml_string_range_type dml_string_split_quoted_options_type dml_transform_info dml_type_info dml_type_info_vec dml_value_map dml_value_map_vec dml_variable dml_variable_vec dset_attribute_info_type dset_info_type dset_mode_info_type dset_parameter_info_type file_dataset_info_type file_information_type general_dataset_info_type lookup_cursor_type lookup_identifier_type lookup_information_type lookupid_address_pair_type mode_type_map multifile_information_type parameter_info_type pe_bool dset_info_type dset_parameter_info_type pe_num dset_info_type dset_parameter_info_type pe_str dset_info_type dset_parameter_info_type period_date_delim_type period_date_type period_time_type period_time_with_tz_type period_timestamp_type period_timestamp_with_tz_type simul_request_response_t table_dataset_info_type validation_analyzed_component_t validation_analyzed_graph_t validation_component_t validation_dataset_record_vec_t validation_decimal_t validation_flow_t validation_graph_t validation_graphinfo_t validation_parameter_t validation_port_t validation_str_t validation_vector_str_t vld_aggr_global_from_vec_result_t vld_aggr_global_result_t vld_aggr_local_result_t vld_check_aggr_result_t vld_simple_result_t xml_attribute xml_element xml_id
syn keyword cppBoolean true false
syn keyword cppConstant __cplusplus
" C++ 11 extensions
if !exists("cpp_no_cpp11")
syn keyword cppType override final
syn keyword cppExceptions noexcept
syn keyword cppStorageClass constexpr decltype thread_local
syn keyword cppConstant nullptr
syn keyword cppConstant ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
syn keyword cppConstant ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
syn keyword cppConstant ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE
syn keyword cppConstant ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
syn keyword cppConstant ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE
syn keyword cppConstant ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
syn region cppRawString matchgroup=cppRawDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell
endif
" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"
" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
if version < 508
let did_cpp_syntax_inits = 1
command -nargs=+ HiLink hi link <args>
else
command -nargs=+ HiLink hi def link <args>
endif
HiLink cppAccess cppStatement
HiLink cppCast cppStatement
HiLink dmlCast Statement
HiLink cppExceptions Exception
HiLink dmlExceptions Exception
HiLink cppOperator Operator
HiLink dmlOperator Operator
HiLink cppStatement Statement
HiLink dmlStatement Statement
HiLink cppType Type
HiLink dmlType Identifier
HiLink cppStorageClass StorageClass
HiLink cppStructure Structure
HiLink dmlStructure Statement
HiLink cppBoolean Boolean
HiLink cppConstant Constant
HiLink cppRawDelimiter Delimiter
HiLink cppRawString String
delcommand HiLink
endif
let b:current_syntax = "dml"
" vim: ts=8
