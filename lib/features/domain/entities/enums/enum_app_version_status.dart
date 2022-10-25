/// 
/// ```
/// - updated  => r:1.0.0 == l:1.0.0
/// - valid    => r:1.0.[0:9], l:1.0.[0:9]
/// - outdated => r:1.1.0, l:1.0.[0:9]
/// - invalid  => r:1.1.0, l:null
/// ```
///

enum AppVersionStatus {
  updated,
  valid,
  outdated,
  invalid,
}