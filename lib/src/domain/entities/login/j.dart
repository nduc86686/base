/// access_token : "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJHZUdVd3NxcVM2TXRaM0xuOW12NVFNRzBDQkJ4a0Jfc01zVmhPUHJHYThNIn0.eyJqdGkiOiIwYTAxYmI5My1iNWM0LTQ4NjEtODdiZi1kNjkzNjk2Y2Y4NmQiLCJleHAiOjE2NTkyNTUzNzgsIm5iZiI6MCwiaWF0IjoxNjU2NjYzMzc4LCJpc3MiOiJodHRwczovL3Nzby5tY2Jvb2tzLnZuL2F1dGgvcmVhbG1zL01DQk9PSyIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiJjNTkzMWNiMC0xY2MyLTQ5NzUtOTVlMy0xNmU2YWRlY2ViMjQiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJtb2JpbGUiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiJkOTVjMTdiMS1iZjVkLTQ5ZjItYTNkZS1hNDkwNmQ1M2M2NzgiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImJvb2tfdmlldyJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoiIiwiaWQiOiJjNTkzMWNiMC0xY2MyLTQ5NzUtOTVlMy0xNmU2YWRlY2ViMjQifQ.UcjlPrIbdnse-H4_BlyyNARUfe4980EwdsETMGjE1cLGp9YDcUolCg3IynLGRHSepi_t9fGWt9sWZmayFi-MTIqDcAzadqno25BXDzkXfAaIJpowlWanVdaYjbOckdyFpPT1XVojaO-jOqm8vI0sb23x78vkz8Z0DLuFAaACEkfGtVdDhWYl2mtlHmlwifhDKttXH0tGILiF1-sWfwPQGvGpMijUVEj8kpOP1lW4gp3nT8KmAol4jny5DbQ4SExkd8O853lLV_w8FCF25QxN5VnzkKtNWfMHgAQLLNbRT68G5QNoFPei5TkAFXyaPOPNJWuYKc3MKYgPg2BQ_uX2zA"
/// expires_in : 2592000
/// refresh_expires_in : 2592000
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJlM2RiZDg3MS0yNmQ4LTQ1ZTAtYTJiZC1kNjA3NGYwZDYzYWQifQ.eyJqdGkiOiI0MTkxOWRmYi04NDM5LTQzZTAtYjZjNy04YzQ5NDgwN2U1ZGQiLCJleHAiOjE2NTkyNTUzNzgsIm5iZiI6MCwiaWF0IjoxNjU2NjYzMzc4LCJpc3MiOiJodHRwczovL3Nzby5tY2Jvb2tzLnZuL2F1dGgvcmVhbG1zL01DQk9PSyIsImF1ZCI6Imh0dHBzOi8vc3NvLm1jYm9va3Mudm4vYXV0aC9yZWFsbXMvTUNCT09LIiwic3ViIjoiYzU5MzFjYjAtMWNjMi00OTc1LTk1ZTMtMTZlNmFkZWNlYjI0IiwidHlwIjoiUmVmcmVzaCIsImF6cCI6Im1vYmlsZSIsImF1dGhfdGltZSI6MCwic2Vzc2lvbl9zdGF0ZSI6ImQ5NWMxN2IxLWJmNWQtNDlmMi1hM2RlLWE0OTA2ZDUzYzY3OCIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJib29rX3ZpZXciXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6IiJ9.VGRhaOlfSmobjxL4SNyUFi6pdbWr-X1F47a4XVvRI08"
/// token_type : "bearer"
/// not-before-policy : 1532570082
/// session_state : "d95c17b1-bf5d-49f2-a3de-a4906d53c678"
/// scope : ""

class J {
  J({
      this.accessToken, 
      this.expiresIn, 
      this.refreshExpiresIn, 
      this.refreshToken, 
      this.tokenType, 
      this.notbeforepolicy, 
      this.sessionState, 
      this.scope,});

  J.fromJson(dynamic json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    refreshExpiresIn = json['refresh_expires_in'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    notbeforepolicy = json['not-before-policy'];
    sessionState = json['session_state'];
    scope = json['scope'];
  }
  String? accessToken;
  int? expiresIn;
  int? refreshExpiresIn;
  String? refreshToken;
  String? tokenType;
  int? notbeforepolicy;
  String? sessionState;
  String? scope;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['expires_in'] = expiresIn;
    map['refresh_expires_in'] = refreshExpiresIn;
    map['refresh_token'] = refreshToken;
    map['token_type'] = tokenType;
    map['not-before-policy'] = notbeforepolicy;
    map['session_state'] = sessionState;
    map['scope'] = scope;
    return map;
  }

}