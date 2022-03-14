terraform {
  /*
  ~> : Allows only the rightmost version component to increment. ex) ~> 1.0.4, allowed 1.0.5 and 1.0.10, but not allowed 1.1.0
  */
  required_version = ">= 1.0.0"
}