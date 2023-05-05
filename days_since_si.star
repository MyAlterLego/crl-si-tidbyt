load("render.star", "render")
load("time.star", "time")
load("@stdlib//jsonnet/jsonnet.libsonnet", "jsonnet")

def main():
    # Read the target date from a file in a GitHub repository
    url = "https://raw.githubusercontent.com/MyAlterLego/crl-si-tidbyt/blob/main/si-date.txt"
    target_date_str = jsonnet.makeHttpRequest(url).body
    target_date = time.parse_time(target_date_str)

    # Calculate the difference between the current time and the target time
    now = time.now()
    delta = now - target_date

    # Format the result as a string and display it
    return render.Root(
        child = render.Text(f"{delta.days} days since target date")
    )