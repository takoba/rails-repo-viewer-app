# rails-repo-viewer-app

## Usage

### batch (rails runner)

```bash
bundle exec rails runner -e production "Batch::GetIssues.exec({ page: __PAGE_NUM__ })"
```

