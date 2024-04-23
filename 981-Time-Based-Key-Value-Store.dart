class TimeMap {
  final storage = <String, List<TimeValue>>{};

  void set(String key, String value, int timestamp) {
    storage[key]?.add(TimeValue(timestamp, value));
    storage[key] ??= [TimeValue(timestamp, value)];
  }
  
  String get(String key, int timestamp) {
    if(storage.containsKey(key)) {
      final value = binarySearch(storage[key]!, timestamp);
      if(value != null) return value.value;
    }

    return '';
  }

  TimeValue? binarySearch(List<TimeValue> values, int timestamp) {
    final len = values.length;
    TimeValue? res;

    for(int l = 0, r = len - 1; l <= r;) {

        final mid = (l + r) ~/ 2;
        final time = values[mid].timestamp;

        if(time == timestamp){
            return values[mid];

        } else if(time < timestamp){
            res = values[mid];
            l=mid+1;

        } else {
            r=mid-1;
        }
        
    }

    return res;
  }
}

class TimeValue {
  final int timestamp;
  final String value;

  TimeValue(this.timestamp, this.value);
}


/*
//Brute Force 

class TimeMap {
  final Map<String, List<KeyValue>> _data; // Key -> List of (timestamp, value) pairs

  TimeMap() : _data = {};

  void set(String key, String value, int timestamp) {
    _data.putIfAbsent(key, () => []).add(KeyValue(timestamp, value));
  }

  String get(String key, int timestamp) {
    if (!_data.containsKey(key)) {
      return "";
    }

    // Brute force search for the latest value with timestamp <= target
    List<KeyValue> keyValues = _data[key]!; // Get the value list for the key
    String lastValue = "";
    for (var keyValue in keyValues) {
      if (keyValue.timestamp <= timestamp) {
        lastValue = keyValue.value;
      } else {
        break; // Found a timestamp greater than target, stop searching
      }
    }
    return lastValue;
  }
}

class KeyValue {
  final int timestamp;
  final String value;

  KeyValue(this.timestamp, this.value);
}
*/