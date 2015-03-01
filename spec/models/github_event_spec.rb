require 'spec_helper'

describe GithubEvent do
  subject(:event){build(:github_event)}

  describe '#as_json' do
    it 'generates the expected object' do
      expect(event.as_json).to eq({
        'meta' => {'event' => 'pull_request', 'event_id' => 'bdb6ec00-5284-11e4-8e22-6dacd62599e2'
        },
        'payload' => {
          'action' => 'reopened',
          'number' => 1,
          'pull_request' => {
            'id' => 20475297,
            'number' => 1,
            'state' => 'open',
            'locked' => false,
            'title' => 'Add mostly bad files',
            'user' => {'login' => 'blatyo', 'id' => 71221, 'gravatar_id' => '', 'type' => 'User', 'site_admin' => false},
            'body' => '',
            'created_at' => '2014-08-29T00:11:15Z',
            'updated_at' => '2014-10-13T02:58:00Z',
            'closed_at' => nil,
            'merged_at' => nil,
            'merge_commit_sha' => 'b34efa6e273de23f458fe864bc3a29cf6c58e886',
            'assignee' => nil,
            'milestone' => nil,
            'head' => {
              'label' => 'lintci:mostly-bad',
              'ref' => 'mostly-bad',
              'sha' => '6dbc62fe88432b6f9489a3d9f00dddf955a44c4e',
              'user' => {'login' => 'lintci', 'id' => 7980645, 'gravatar_id' => '', 'type' => 'Organization', 'site_admin' => false},
              'repo' => {
                'id' => 23446068,
                'name' => 'guinea_pig',
                'full_name' => 'lintci/guinea_pig',
                'owner' => {'login' => 'lintci', 'id' => 7980645, 'gravatar_id' => '', 'type' => 'Organization', 'site_admin' => false},
                'private' => false,
                'description' => 'Project to test LintCI against',
                'fork' => false,
                'created_at' => '2014-08-28T23:21:41Z',
                'updated_at' => '2014-08-28T23:25:08Z',
                'pushed_at' => '2014-08-28T23:28:28Z',
                'homepage' => nil,
                'size' => 164,
                'stargazers_count' => 0,
                'watchers_count' => 0,
                'language' => 'Go',
                'has_issues' => true,
                'has_downloads' => true,
                'has_wiki' => true,
                'has_pages' => false,
                'forks_count' => 0,
                'open_issues_count' => 1,
                'forks' => 0,
                'open_issues' => 1,
                'watchers' => 0,
                'default_branch' => 'master'
              }
            },
            'base' => {
              'label' => 'lintci:master',
              'ref' => 'master',
              'sha' => 'bbf813a806dacf043a592f04a0ed320236caca3a',
              'user' => {'login' => 'lintci', 'id' => 7980645, 'gravatar_id' => '', 'type' => 'Organization', 'site_admin' => false},
              'repo' => {
                'id' => 23446068,
                'name' => 'guinea_pig',
                'full_name' => 'lintci/guinea_pig',
                'owner' => {'login' => 'lintci', 'id' => 7980645, 'gravatar_id' => '', 'type' => 'Organization', 'site_admin' => false},
                'private' => false,
                'description' => 'Project to test LintCI against',
                'fork' => false,
                'created_at' => '2014-08-28T23:21:41Z',
                'updated_at' => '2014-08-28T23:25:08Z',
                'pushed_at' => '2014-08-28T23:28:28Z',
                'homepage' => nil,
                'size' => 164,
                'stargazers_count' => 0,
                'watchers_count' => 0,
                'language' => 'Go',
                'has_issues' => true,
                'has_downloads' => true,
                'has_wiki' => true,
                'has_pages' => false,
                'forks_count' => 0,
                'open_issues_count' => 1,
                'forks' => 0,
                'open_issues' => 1,
                'watchers' => 0,
                'default_branch' => 'master'
              }
            },
            'merged' => false,
            'mergeable' => true,
            'mergeable_state' => 'clean',
            'merged_by' => nil,
            'comments' => 0,
            'review_comments' => 1,
            'commits' => 1,
            'additions' => 36,
            'deletions' => 0,
            'changed_files' => 10
          },
          'repository' => {
            'id' => 23446068,
            'name' => 'guinea_pig',
            'full_name' => 'lintci/guinea_pig',
            'owner' => {'login' => 'lintci', 'id' => 7980645, 'gravatar_id' => '', 'type' => 'Organization', 'site_admin' => false},
            'private' => false,
            'description' => 'Project to test LintCI against',
            'fork' => false,
            'created_at' => '2014-08-28T23:21:41Z',
            'updated_at' => '2014-08-28T23:25:08Z',
            'pushed_at' => '2014-08-28T23:28:28Z',
            'homepage' => nil,
            'size' => 164,
            'stargazers_count' => 0,
            'watchers_count' => 0,
            'language' => 'Go',
            'has_issues' => true,
            'has_downloads' => true,
            'has_wiki' => true,
            'has_pages' => false,
            'forks_count' => 0,
            'open_issues_count' => 1,
            'forks' => 0,
            'open_issues' => 1,
            'watchers' => 0,
            'default_branch' => 'master'},
          'organization' => {'login' => 'lintci', 'id' => 7980645},
          'sender' => {'login' => 'blatyo', 'id' => 71221, 'gravatar_id' => '', 'type' => 'User', 'site_admin' => false}
        }
      })
    end
  end
end
