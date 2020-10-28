/*
* Copyright (c) 2020 Risk Focus Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

module "base_label" {
  source              = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2"
  namespace           = var.project_rev_fqdn
  regex_replace_chars = "/[^a-zA-Z0-9-.]/"
  delimiter           = "."
}

