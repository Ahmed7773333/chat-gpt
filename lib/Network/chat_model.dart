class GPTResponce {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  GPTResponce(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});

  GPTResponce.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }
}

class Choices {
  String? text;
  int? index;
  // ignore: prefer_void_to_null
  Null logprobs;
  String? finishReason;

  Choices({this.text, this.index, this.logprobs, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    index = json['index'];
    logprobs = json['logprobs'];
    finishReason = json['finish_reason'];
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }
}
