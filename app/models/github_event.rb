class GithubEvent < Struct.new(:event, :event_id, :payload)
  def as_json
    {
      'meta' => {
        'event' => event,
        'event_id' => event_id
      },
      'payload' => strip_excessive_urls(payload.deep_dup)
    }
  end

private

  def strip_excessive_urls(hash)
    hash.except!(*EXCESSIVE_URLS)
    hash.each{|_, value| strip_excessive_urls(value) if value.is_a?(Hash)}
  end

  EXCESSIVE_URLS = %w(
    _links
    url
    html_url
    diff_url
    patch_url
    issue_url
    avatar_url
    followers_url
    following_url
    gists_url
    starred_url
    subscriptions_url
    organizations_url
    repos_url
    events_url
    received_events_url
    commits_url
    review_comments_url
    review_comment_url
    comments_url
    statuses_url
    forks_url
    keys_url
    collaborators_url
    teams_url
    hooks_url
    issue_events_url
    assignees_url
    branches_url
    tags_url
    blobs_url
    git_tags_url
    git_refs_url
    trees_url
    languages_url
    stargazers_url
    contributors_url
    subscribers_url
    subscription_url
    git_commits_url
    issue_comment_url
    contents_url
    compare_url
    merges_url
    archive_url
    downloads_url
    issues_url
    pulls_url
    milestones_url
    notifications_url
    labels_url
    releases_url
    git_url
    ssh_url
    clone_url
    svn_url
    mirror_url
    members_url
    public_members_url
  )
end
